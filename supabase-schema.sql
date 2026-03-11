-- Supabase SQL Editor에서 실행하세요.
-- 테이블: 추첨된 로또 번호 저장

create table if not exists public.lotto_draws (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  main_numbers int[] not null check (array_length(main_numbers, 1) = 6),
  bonus_number int not null check (bonus_number between 1 and 45),
  set_index int null
);

comment on table public.lotto_draws is '앱에서 추첨된 번호 세트';

alter table public.lotto_draws enable row level security;

-- 익명 insert (anon key 사용 시)
create policy "anon insert lotto_draws"
  on public.lotto_draws for insert
  to anon
  with check (true);

-- 읽기 필요 시 (선택)
create policy "anon select lotto_draws"
  on public.lotto_draws for select
  to anon
  using (true);
