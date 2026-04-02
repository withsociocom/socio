# How to Run Supabase Migrations

## Quick Method (Recommended) 🚀

1. Go to [Supabase Dashboard](https://app.supabase.com/)
2. Select your project: **socio2026v2**
3. Navigate to **SQL Editor** (left sidebar)
4. Click **New Query**
5. **Copy all content** from [SUPABASE_MIGRATIONS_RUNME.sql](./SUPABASE_MIGRATIONS_RUNME.sql)
6. **Paste** into the SQL editor
7. Click **Run** (⏵ button in top right)
8. Wait for completion (should show green checkmark ✅)

---

## What This Migration Does

### Creates Table: `departments_courses`
- Stores all 24 departments from Christ University
- Each department has associated courses + class information in JSON format
- Includes room assignments, blocks, and term info
- **24 departments** total with **347 class entries**

### Schema:
```sql
CREATE TABLE departments_courses (
  id UUID PRIMARY KEY (auto-generated)
  department_name TEXT UNIQUE (e.g., "COMPUTER SCIENCE")
  school TEXT (e.g., "SCHOOL OF SCIENCES")
  courses_json JSONB (hierarchical course data)
  created_at TIMESTAMP
  updated_at TIMESTAMP
)
```

### Links Users to Departments
- Adds `department_id` column to users table
- Creates foreign key relationship
- Cascade delete: If department deleted, user's department_id becomes NULL

---

## Verify It Worked ✅

After running migration, execute this query:

```sql
-- Check departments were created
SELECT COUNT(*) as department_count FROM public.departments_courses;
-- Should return: 24

-- Check users table has new column
SELECT column_name FROM information_schema.columns 
WHERE table_name = 'users' AND column_name = 'department_id';
-- Should return one row with 'department_id'
```

---

## Next Steps

1. **View department data**: 
```sql
SELECT department_name, school, courses_json 
FROM departments_courses 
LIMIT 1;
-- Shows JSONB structure of courses
```

2. **Assign user to department**:
```sql
UPDATE users 
SET department_id = (SELECT id FROM departments_courses WHERE department_name = 'COMPUTER SCIENCE')
WHERE id = 'user_uuid_here';
```

3. **Create API endpoints** to:
   - Fetch departments list
   - Get courses for a department
   - Assign user to department

---

## Troubleshooting

**Error: "departments_courses already exists"**
- It's fine! The migration uses `IF NOT EXISTS` clauses
- Just run it again

**Error: "set_updated_at function doesn't exist"**
- The trigger will be added if the function exists
- You can safely ignore this if your setup doesn't have the trigger function

**Column already exists on users table**
- Again, `IF NOT EXISTS` handles this
- Safe to re-run

---

## CSV Export (Optional)

To export all departments as CSV from Supabase Dashboard:
1. Go to **Table Editor** 
2. Select **departments_courses** table
3. Click **Download** → Select format
4. Share with team

---

**Time to complete**: ~30 seconds
**No external dependencies**: Pure PostgreSQL SQL

---

## ⚠️ URGENT: Fix Notifications Not Persisting (Migration 006)

### The Problem
Notifications show as "+1 unread" but when you refresh/logout-login, they reappear as unread again. **Read status is lost.**

### Root Cause
The `notification_user_status` table was missing from your Supabase. This table tracks which users have read each broadcast notification.

### The Fix
Run this migration **immediately**:

1. Go to [Supabase SQL Editor](https://app.supabase.com/)
2. Click **New Query**
3. Copy all content from [server/migrations/006_add_notification_user_status.sql](./server/migrations/006_add_notification_user_status.sql)
4. Paste and click **Run** ▶️

### What It Does
- ✅ Creates `notification_user_status` table
- ✅ Tracks per-user read/dismiss status for broadcast notifications
- ✅ Adds proper foreign key relationships + RLS
- ✅ Creates auto-updated timestamp triggers

### Verify Success
```sql
-- Should return 1 table
SELECT COUNT(*) FROM information_schema.tables 
WHERE table_name = 'notification_user_status';

-- Should return true
SELECT has_table('public', 'notification_user_status');
```

### After Migration
- All future notifications will persist across refreshes ✅
- Marking as read will actually save to database ✅
- Badge count will disappear when you read notifications ✅

---

**Critical for**: Notification feature to work properly
**Time to complete**: ~10 seconds
