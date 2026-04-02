-- ===============================================================
-- SOCIO Supabase Migrations - Departments & Classes (Simple)
-- ===============================================================
-- Run these in the Supabase SQL Editor (Dashboard > SQL Editor > New Query)
-- ===============================================================

-- 1. Create departments_courses table
create table if not exists public.departments_courses (
  id uuid primary key default gen_random_uuid(),
  department_name text unique not null,
  school text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_departments_courses_name on public.departments_courses(lower(department_name));

-- 2. Create classes table
create table if not exists public.classes (
  id uuid primary key default gen_random_uuid(),
  class_name text not null,
  department_id uuid not null references public.departments_courses(id) on delete cascade,
  created_at timestamptz not null default now()
);

create index if not exists idx_classes_department_id on public.classes(department_id);
create index if not exists idx_classes_name on public.classes(class_name);

-- 3. Populate departments (24 departments)
INSERT INTO public.departments_courses (department_name, school) VALUES ('BUSINESS AND MANAGEMENT  (BBA)', 'SCHOOL OF BUSINESS AND MANAGEMENT') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('BUSINESS AND MANAGEMENT  (MBA)', 'SCHOOL OF BUSINESS AND MANAGEMENT') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('CHEMISTRY', 'SCHOOL OF SCIENCES') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('COMMERCE', 'SCHOOL OF COMMERCE FINANCE AND ACCOUNTANCY') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('COMPUTER SCIENCE', 'SCHOOL OF SCIENCES') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('ECONOMICS', 'SCHOOL OF SOCIAL SCIENCES') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('ENGLISH AND CULTURAL STUDIES', 'SCHOOL OF HUMANITIES AND PERFORMING ARTS') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('HOTEL MANAGEMENT', 'SCHOOL OF BUSINESS AND MANAGEMENT') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('INTERNATIONAL STUDIES, POLITICAL SCIENCE AND HISTORY', 'SCHOOL OF SOCIAL SCIENCES') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('LIFE SCIENCES', 'SCHOOL OF SCIENCES') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('MATHEMATICS', 'SCHOOL OF SCIENCES') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('MEDIA STUDIES', 'SCHOOL OF SOCIAL SCIENCES') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('MUSIC', 'SCHOOL OF HUMANITIES AND PERFORMING ARTS') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('PERFORMING ARTS', 'SCHOOL OF HUMANITIES AND PERFORMING ARTS') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('PHILOSOPHY AND THEOLOGY', 'SCHOOL OF HUMANITIES AND PERFORMING ARTS') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('PHYSICS AND ELECTRONICS', 'SCHOOL OF SCIENCES') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('PROFESSIONAL STUDIES', 'SCHOOL OF COMMERCE FINANCE AND ACCOUNTANCY') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('PSYCHOLOGY', 'SCHOOL OF PSYCHOLOGICAL SCIENCES, EDUCATION AND SOCIAL WORK') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('SCHOOL OF EDUCATION', 'SCHOOL OF PSYCHOLOGICAL SCIENCES, EDUCATION AND SOCIAL WORK') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('SCHOOL OF LAW', 'SCHOOL OF LAW') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('SOCIAL WORK', 'SCHOOL OF PSYCHOLOGICAL SCIENCES, EDUCATION AND SOCIAL WORK') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('SOCIOLOGY', 'SCHOOL OF SOCIAL SCIENCES') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('STATISTICS AND DATA SCIENCE', 'SCHOOL OF SCIENCES') ON CONFLICT DO NOTHING;
INSERT INTO public.departments_courses (department_name, school) VALUES ('THEATRE STUDIES', 'SCHOOL OF HUMANITIES AND PERFORMING ARTS') ON CONFLICT DO NOTHING;

-- 4. Populate classes (extracted from Excel)
INSERT INTO public.classes (class_name, department_id) SELECT '2BBA A', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BBA B', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BBA C', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BBA D', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BBA E', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BBA F', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BBAA', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BBAB', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BBAC', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BBAD', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BBAE', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BBAF', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BBAA', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BBAB', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BBAC', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BBAD', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BBAE', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BBAF', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BBADS', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BBADS', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BBADS', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (BBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAG', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAH', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAI', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAJ', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAK', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAL', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAM', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAN', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN BA2', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN BA3', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN F4', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN F5', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN F6', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN F7', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN F8', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN HR', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN LOS3', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN LOS4', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN M4', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN M5', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN M6', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBA MAIN M7', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN BA2', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN BA3', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN F4', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN F5', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN F6', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN F7', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN F8', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN HR', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN LOS3', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN LOS4', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN M4', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN M5', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN M6', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MBA MAIN M7', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAT', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBAT', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAV', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBAV', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAW', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBAW', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBAX', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBAX', id FROM public.departments_courses WHERE department_name = 'BUSINESS AND MANAGEMENT  (MBA)' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScCZ', id FROM public.departments_courses WHERE department_name = 'CHEMISTRY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScCZ', id FROM public.departments_courses WHERE department_name = 'CHEMISTRY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScCZ', id FROM public.departments_courses WHERE department_name = 'CHEMISTRY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MCHE', id FROM public.departments_courses WHERE department_name = 'CHEMISTRY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MCHE', id FROM public.departments_courses WHERE department_name = 'CHEMISTRY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOM A', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOM B', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOM C', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOM D', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMA', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMB', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMC', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMD', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMA', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMB', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMC', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMD', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOM F', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMF', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMF', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMA&T', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMA&T', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMA&T', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMAFA', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMAFA', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMAFA', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMF&I A', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMF&I B', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMF&I A', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMF&I B', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMF&I A', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMF&I B', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMSF', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMSF', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMSF', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BSc A&A', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BSc A&A', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MCOM', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MCOM', id FROM public.departments_courses WHERE department_name = 'COMMERCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCA A', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCA B', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCA A', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCA B', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCA A', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCA B', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScCM', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScCM', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScCM', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScCS', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScCS', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScCS', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MCA A', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MCA B', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MCA A', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MCA B', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MCA A', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MCA B', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSAIM', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MSAIM', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MSAIM', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSCSA', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MSCSA', id FROM public.departments_courses WHERE department_name = 'COMPUTER SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MAECO', id FROM public.departments_courses WHERE department_name = 'ECONOMICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MAECO', id FROM public.departments_courses WHERE department_name = 'ECONOMICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MENG', id FROM public.departments_courses WHERE department_name = 'ENGLISH AND CULTURAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MENG', id FROM public.departments_courses WHERE department_name = 'ENGLISH AND CULTURAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BHM', id FROM public.departments_courses WHERE department_name = 'HOTEL MANAGEMENT' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BHM', id FROM public.departments_courses WHERE department_name = 'HOTEL MANAGEMENT' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BHM', id FROM public.departments_courses WHERE department_name = 'HOTEL MANAGEMENT' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '8BHM', id FROM public.departments_courses WHERE department_name = 'HOTEL MANAGEMENT' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BAHP', id FROM public.departments_courses WHERE department_name = 'INTERNATIONAL STUDIES, POLITICAL SCIENCE AND HISTORY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BAHP', id FROM public.departments_courses WHERE department_name = 'INTERNATIONAL STUDIES, POLITICAL SCIENCE AND HISTORY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BAHP', id FROM public.departments_courses WHERE department_name = 'INTERNATIONAL STUDIES, POLITICAL SCIENCE AND HISTORY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MAIS', id FROM public.departments_courses WHERE department_name = 'INTERNATIONAL STUDIES, POLITICAL SCIENCE AND HISTORY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MAIS', id FROM public.departments_courses WHERE department_name = 'INTERNATIONAL STUDIES, POLITICAL SCIENCE AND HISTORY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MAPP', id FROM public.departments_courses WHERE department_name = 'INTERNATIONAL STUDIES, POLITICAL SCIENCE AND HISTORY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MAPP', id FROM public.departments_courses WHERE department_name = 'INTERNATIONAL STUDIES, POLITICAL SCIENCE AND HISTORY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScBtB', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScBtB', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScBtB', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScBtC', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScBtC', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScBtC', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScBtF', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScBtF', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScBtF', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScBtZ', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScBtZ', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScBtZ', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScLIF', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScLIF', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScLIF', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBOT', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBOT', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MBTY', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MBTY', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MFS', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MFS', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MZOO', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MZOO', id FROM public.departments_courses WHERE department_name = 'LIFE SCIENCES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2EMS', id FROM public.departments_courses WHERE department_name = 'MATHEMATICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4EMS', id FROM public.departments_courses WHERE department_name = 'MATHEMATICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6EMS', id FROM public.departments_courses WHERE department_name = 'MATHEMATICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MMAT', id FROM public.departments_courses WHERE department_name = 'MATHEMATICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MMAT', id FROM public.departments_courses WHERE department_name = 'MATHEMATICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BACE', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BACE', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BACE', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BACP', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BACP', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BACP', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BAJE', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BAJE', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BAJE', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MAMCS ACC', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MAMCS DTCS', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MAMCS ACC', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MAMCS MJ', id FROM public.departments_courses WHERE department_name = 'MEDIA STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BAMC', id FROM public.departments_courses WHERE department_name = 'MUSIC' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BAMC', id FROM public.departments_courses WHERE department_name = 'MUSIC' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BAMC', id FROM public.departments_courses WHERE department_name = 'MUSIC' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BAMP', id FROM public.departments_courses WHERE department_name = 'MUSIC' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BAMP', id FROM public.departments_courses WHERE department_name = 'MUSIC' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BAMP', id FROM public.departments_courses WHERE department_name = 'MUSIC' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BAPC', id FROM public.departments_courses WHERE department_name = 'PERFORMING ARTS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BAPC', id FROM public.departments_courses WHERE department_name = 'PERFORMING ARTS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BAPC', id FROM public.departments_courses WHERE department_name = 'PERFORMING ARTS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BAPP', id FROM public.departments_courses WHERE department_name = 'PERFORMING ARTS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BAPP', id FROM public.departments_courses WHERE department_name = 'PERFORMING ARTS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BAPP', id FROM public.departments_courses WHERE department_name = 'PERFORMING ARTS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPAB', id FROM public.departments_courses WHERE department_name = 'PERFORMING ARTS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPAB', id FROM public.departments_courses WHERE department_name = 'PERFORMING ARTS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BPHL', id FROM public.departments_courses WHERE department_name = 'PHILOSOPHY AND THEOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BPHL', id FROM public.departments_courses WHERE department_name = 'PHILOSOPHY AND THEOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BPHL', id FROM public.departments_courses WHERE department_name = 'PHILOSOPHY AND THEOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MACS', id FROM public.departments_courses WHERE department_name = 'PHILOSOPHY AND THEOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MACS', id FROM public.departments_courses WHERE department_name = 'PHILOSOPHY AND THEOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MARL A', id FROM public.departments_courses WHERE department_name = 'PHILOSOPHY AND THEOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MARL A', id FROM public.departments_courses WHERE department_name = 'PHILOSOPHY AND THEOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPHL', id FROM public.departments_courses WHERE department_name = 'PHILOSOPHY AND THEOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPHL', id FROM public.departments_courses WHERE department_name = 'PHILOSOPHY AND THEOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2PGDR A', id FROM public.departments_courses WHERE department_name = 'PHILOSOPHY AND THEOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScPCm', id FROM public.departments_courses WHERE department_name = 'PHYSICS AND ELECTRONICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScPMa', id FROM public.departments_courses WHERE department_name = 'PHYSICS AND ELECTRONICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPHY', id FROM public.departments_courses WHERE department_name = 'PHYSICS AND ELECTRONICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPHY', id FROM public.departments_courses WHERE department_name = 'PHYSICS AND ELECTRONICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScPC', id FROM public.departments_courses WHERE department_name = 'PHYSICS AND ELECTRONICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScPC', id FROM public.departments_courses WHERE department_name = 'PHYSICS AND ELECTRONICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScPM', id FROM public.departments_courses WHERE department_name = 'PHYSICS AND ELECTRONICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScPM', id FROM public.departments_courses WHERE department_name = 'PHYSICS AND ELECTRONICS' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOM B&E', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMF&A A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMF&A B', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMF&A C', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMF&A D', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMF&A A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMF&A B', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMF&A C', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMF&A D', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMF&A A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMF&A B', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMF&A C', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMF&A D', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMIAF A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMIAF B', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMIAF C', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMIAF A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMIAF B', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMIAF C', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMIAF A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMIAF B', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMIF A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMIF B', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMIF A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMIF B', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMIF', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BCOMP A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMP A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BCOMP B', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMP A', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BCOMP B', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScAS', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MCOM IF', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MCOM IF', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSAS', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MSAS', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSIE', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MSIE', id FROM public.departments_courses WHERE department_name = 'PROFESSIONAL STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BAPECO', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BAPECO', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BAPECO', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BAPENG', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BAPENG', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BAPENG', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPCL A', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPCL B', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPCL A', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPCL B', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPCO', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPCO', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPCPO', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPCPO', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPHR', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPHR', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPHRG', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPHRG', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPHW', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPHW', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MPNP', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MPNP', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSEDP', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MSEDP', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2PGDCP', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '8BAPSY(H) BCC', id FROM public.departments_courses WHERE department_name = 'PSYCHOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BEd A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF EDUCATION' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BEd B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF EDUCATION' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BEd A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF EDUCATION' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BEd B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF EDUCATION' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2PGDIE', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF EDUCATION' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '10BALLB A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '10BALLB B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '10BALLB C', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BALLB A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BALLB B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BALLB C', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BALLB A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BALLB B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BALLB C', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BALLB A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BALLB B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BALLB C', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '8BALLB A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '8BALLB B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '8BALLB C', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '10BBALLB A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '10BBALLB B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BBALLB A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BBALLB B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BBALLB C', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BBALLB A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BBALLB B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BBALLB A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BBALLB B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '8BBALLB A', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '8BBALLB B', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2LLMCAL', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2LLMCCL', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2LLMIPL', id FROM public.departments_courses WHERE department_name = 'SCHOOL OF LAW' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSWCC', id FROM public.departments_courses WHERE department_name = 'SOCIAL WORK' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MSWCC', id FROM public.departments_courses WHERE department_name = 'SOCIAL WORK' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSWHR', id FROM public.departments_courses WHERE department_name = 'SOCIAL WORK' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MSWHR', id FROM public.departments_courses WHERE department_name = 'SOCIAL WORK' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BAES', id FROM public.departments_courses WHERE department_name = 'SOCIOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BAES', id FROM public.departments_courses WHERE department_name = 'SOCIOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BAES', id FROM public.departments_courses WHERE department_name = 'SOCIOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSOC', id FROM public.departments_courses WHERE department_name = 'SOCIOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MSOC', id FROM public.departments_courses WHERE department_name = 'SOCIOLOGY' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScDM', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScDM', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScDM', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BScDS', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BScDS', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BScDS', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MDS', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MDS', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MDS', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSCSA AI', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MSCSA AI', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSD A&A', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2MSTAT', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4MSTAT', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6MSTAT', id FROM public.departments_courses WHERE department_name = 'STATISTICS AND DATA SCIENCE' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BATC', id FROM public.departments_courses WHERE department_name = 'THEATRE STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BATC', id FROM public.departments_courses WHERE department_name = 'THEATRE STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BATC', id FROM public.departments_courses WHERE department_name = 'THEATRE STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '2BATP', id FROM public.departments_courses WHERE department_name = 'THEATRE STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '4BATP', id FROM public.departments_courses WHERE department_name = 'THEATRE STUDIES' ON CONFLICT DO NOTHING;
INSERT INTO public.classes (class_name, department_id) SELECT '6BATP', id FROM public.departments_courses WHERE department_name = 'THEATRE STUDIES' ON CONFLICT DO NOTHING;

-- 5. Link users table to departments
alter table if exists public.users add column if not exists department_id uuid;

do $$
begin
  if not exists (
    select 1 from information_schema.table_constraints 
    where constraint_name = 'fk_users_department'
  ) then
    alter table public.users
    add constraint fk_users_department
      foreign key (department_id)
      references public.departments_courses(id)
      on update cascade
      on delete set null;
  end if;
end $$;

create index if not exists idx_users_department_id on public.users(department_id);

-- Verify ✅
SELECT COUNT(*) as departments FROM public.departments_courses;
SELECT COUNT(*) as classes FROM public.classes;
