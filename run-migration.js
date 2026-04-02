const fs = require('fs');
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = 'https://wvebxdbvoinylwecmisv.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind2ZWJ4ZGJ2b2lueWx3ZWNtaXN2Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NDM1ODAwNywiZXhwIjoyMDg5OTM0MDA3fQ.gdF-Lz1a99FQFhezww8DMc3JjSoM2dd6t10rk3kcfW8';

const supabase = createClient(supabaseUrl, supabaseKey);

// Read the migration file
const migrationSql = fs.readFileSync('server/migrations/002_new_supabase_schema_adv01_adv03.sql', 'utf-8');

// Split by semicolon and execute statements one by one
const statements = migrationSql.split(';').filter(s => s.trim());

console.log(`Running ${statements.length} SQL statements...`);

async function runMigration() {
  try {
    for (let i = 0; i < statements.length; i++) {
      const statement = statements[i].trim();
      if (!statement) continue;
      
      console.log(`[${i + 1}/${statements.length}] Executing...`);
      
      const { error } = await supabase.rpc('exec', { sql: statement });
      
      if (error) {
        console.error(`Error on statement ${i + 1}:`, error);
      }
    }
    console.log('✅ Migration completed!');
  } catch (err) {
    console.error('Fatal error:', err);
  }
}

runMigration();
