-- MAA Fire Safety Checks – Supabase schema
-- Run this once in Supabase: SQL Editor -> New query -> Run

create extension if not exists pgcrypto;

create table if not exists public.inspection_types (
  id text primary key,
  name text not null,
  frequency text not null,
  months integer not null,
  description text,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists public.inspection_items (
  id uuid primary key default gen_random_uuid(),
  test_id text not null references public.inspection_types(id) on delete cascade,
  item_code text default '',
  location text not null,
  extinguisher_type text,
  sort_order integer not null default 999,
  active boolean not null default true,
  source_table integer,
  source_row integer,
  source_kind text not null default 'added',
  default_photo text,
  photo_path text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists inspection_items_test_idx on public.inspection_items(test_id, active, sort_order);

create table if not exists public.inspections (
  id uuid primary key default gen_random_uuid(),
  test_id text not null references public.inspection_types(id),
  inspection_date date not null default current_date,
  initials text not null default 'F.G.',
  status text not null default 'in_progress' check (status in ('in_progress','completed','cancelled')),
  started_at timestamptz not null default now(),
  completed_at timestamptz
);
create index if not exists inspections_test_status_idx on public.inspections(test_id,status,inspection_date desc);

create table if not exists public.inspection_results (
  id uuid primary key default gen_random_uuid(),
  inspection_id uuid not null references public.inspections(id) on delete cascade,
  item_id uuid not null references public.inspection_items(id),
  result text check (result in ('PASS','FAIL','ISSUE')),
  notes text default '',
  updated_at timestamptz not null default now(),
  unique(inspection_id,item_id)
);
create index if not exists inspection_results_inspection_idx on public.inspection_results(inspection_id);

-- Private bucket used by the Render server as a photo store.
insert into storage.buckets (id, name, public)
values ('inspection-photos','inspection-photos',false)
on conflict (id) do nothing;

-- Keep direct browser access closed. The Render server uses the service-role key.
alter table public.inspection_types enable row level security;
alter table public.inspection_items enable row level security;
alter table public.inspections enable row level security;
alter table public.inspection_results enable row level security;
