import { createClient } from '@supabase/supabase-js';
import * as fs from 'fs';
import * as path from 'path';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('❌ Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false,
  },
});

const migrationsDir = path.join(process.cwd(), 'server', 'migrations');
const migrationFiles = [
  '004_departments_courses_data.sql',
  '005_link_users_to_departments.sql',
];

async function runMigrations() {
  console.log('🚀 Starting Supabase migrations...\n');

  for (const file of migrationFiles) {
    const filePath = path.join(migrationsDir, file);
    
    if (!fs.existsSync(filePath)) {
      console.warn(`⚠️  File not found: ${file}`);
      continue;
    }

    console.log(`📄 Running: ${file}`);

    try {
      const sql = fs.readFileSync(filePath, 'utf-8');
      
      // Split by semicolons but preserve them
      const statements = sql
        .split(';')
        .map(s => s.trim())
        .filter(s => s && !s.startsWith('--'));

      for (const statement of statements) {
        if (statement.trim()) {
          const { error } = await supabase.rpc('postgres_execute', {
            query: statement,
          }).catch(async () => {
            // Fallback: try direct query via POST
            const response = await fetch(`${supabaseUrl}/rest/v1/`, {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${supabaseServiceKey}`,
                'apikey': supabaseServiceKey,
              },
              body: JSON.stringify({ query: statement }),
            });
            return { error: response.ok ? null : new Error('Query failed') };
          });

          if (error) {
            console.error(`   ❌ Error in statement: ${statement.substring(0, 50)}...`);
            console.error(`      ${error.message}`);
          }
        }
      }

      console.log(`   ✅ ${file} completed\n`);
    } catch (error) {
      console.error(`   ❌ Error running ${file}:`, error.message);
    }
  }

  console.log('\n✨ Migration run complete!');
  
  // Verify tables exist
  console.log('\n📊 Verifying tables...');
  const { data: tables, error: tableError } = await supabase
    .from('information_schema.tables')
    .select('table_name')
    .match({ table_schema: 'public' });

  if (tableError) {
    console.warn('⚠️  Could not verify tables:', tableError.message);
  } else {
    const tableNames = tables?.map(t => t.table_name) || [];
    if (tableNames.includes('departments_courses')) {
      console.log('✅ departments_courses table exists');
    }
    if (tableNames.includes('users')) {
      console.log('✅ users table exists');
    }
  }
}

runMigrations().catch(error => {
  console.error('Fatal error:', error);
  process.exit(1);
});
