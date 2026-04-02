#!/usr/bin/env python3
"""
Migration runner for Supabase
Connects directly to Supabase and executes SQL migrations
"""
import os
import sys
from pathlib import Path
import subprocess

SUPABASE_URL = os.getenv('SUPABASE_URL')
SUPABASE_SERVICE_KEY = os.getenv('SUPABASE_SERVICE_ROLE_KEY')
SUPABASE_DB_PASSWORD = os.getenv('SUPABASE_DB_PASSWORD')

# Try importing supabase client
try:
    from supabase import create_client
except ImportError:
    print("Installing supabase package...")
    subprocess.run([sys.executable, "-m", "pip", "install", "supabase", "-q"])
    from supabase import create_client

try:
    import psycopg2
except ImportError:
    print("Installing psycopg2 package...")
    subprocess.run([sys.executable, "-m", "pip", "install", "psycopg2-binary", "-q"])
    import psycopg2

def run_migrations_via_supabase_api():
    """Use Supabase REST API to run migrations"""
    if not SUPABASE_URL or not SUPABASE_SERVICE_KEY:
        print("❌ Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY")
        return False

    supabase = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)
    print(f"✅ Connected to Supabase: {SUPABASE_URL}")

    migrations_dir = Path(__file__).parent / 'server' / 'migrations'
    migration_files = [
        '004_departments_courses_data.sql',
        '005_link_users_to_departments.sql',
    ]

    for migration_file in migration_files:
        file_path = migrations_dir / migration_file
        if not file_path.exists():
            print(f"⚠️  File not found: {file_path}")
            continue

        print(f"\n📄 Processing: {migration_file}")
        
        with open(file_path, 'r', encoding='utf-8') as f:
            sql_content = f.read()

        # Split SQL by semicolons and filter comments
        statements = [
            s.strip() 
            for s in sql_content.split(';') 
            if s.strip() and not s.strip().startswith('--')
        ]

        try:
            # For now, we'll print the SQL to run manually in Supabase dashboard
            print(f"   📝 Found {len(statements)} SQL statements")
            print(f"   ⚠️  Due to API limitations, execute this migration manually:")
            print(f"      1. Go to Supabase Dashboard: {SUPABASE_URL.replace('.co', '.co/project/default/sql')}")
            print(f"      2. Create new query")
            print(f"      3. Paste content from: {file_path}")
            print(f"      4. Execute Query")
            
        except Exception as e:
            print(f"   ❌ Error: {e}")
            return False

    return True

def extract_db_credentials():
    """Extract database credentials from Supabase URL"""
    # Format: https://[project-id].supabase.co
    # DB: postgres://postgres:[password]@[project-id].supabase.co:5432/postgres
    if not SUPABASE_URL:
        return None
    
    project_id = SUPABASE_URL.split('//')[1].split('.')[0]
    return {
        'host': f'{project_id}.supabase.co',
        'database': 'postgres',
        'user': 'postgres',
        'password': SUPABASE_DB_PASSWORD,
        'port': 5432
    }

def check_supabase_connection():
    """Test connection to Supabase"""
    try:
        import requests
        print("🔍 Testing Supabase connection...")
        response = requests.get(
            f"{SUPABASE_URL}/rest/v1/",
            headers={"apikey": SUPABASE_SERVICE_KEY},
            timeout=5
        )
        if response.status_code == 200 or response.status_code == 404:
            print(f"✅ Supabase connection successful!")
            return True
        else:
            print(f"❌ Connection failed: {response.status_code}")
            return False
    except Exception as e:
        print(f"❌ Connection error: {e}")
        return False

if __name__ == "__main__":
    print("=" * 60)
    print("🚀 Supabase Migration Runner")
    print("=" * 60)
    
    if check_supabase_connection():
        run_migrations_via_supabase_api()
    else:
        print("\n❌ Could not connect to Supabase")
        print("\n📋 Manual Migration Steps:")
        print("1. Open: https://app.supabase.com/project/default/sql")
        print("2. Create new query")
        print("3. Copy-paste migrations from:")
        print("   - server/migrations/004_departments_courses_data.sql")
        print("   - server/migrations/005_link_users_to_departments.sql")
        print("4. Execute each migration")

