# 로또 번호 추천

1~45 번호 중 무작위로 6개 + 보너스 번호를 뽑아주는 웹 서비스입니다.

## 사용 방법 (웹에서 실행)

**로컬 웹 서버로 실행 (권장)**

1. 터미널에서 프로젝트 폴더로 이동한 뒤:
   ```bash
   npm start
   ```
2. 브라우저에서 **http://localhost:3000** 으로 접속합니다.

또는 `index.html`을 브라우저에서 직접 열어도 동작합니다.

- **세트 수**에서 한 번에 뽑을 조 개수를 선택합니다 (1 / 3 / 5 / 10).
- **번호 뽑기** 버튼을 누르면 추천 번호가 생성됩니다.
- 각 세트는 정렬된 6개 번호 + 보너스 번호(맨 뒤 +)로 표시됩니다.

## Git 저장소 (변경 사항 푸시)

원격 저장소: [https://github.com/jes2412/20260311](https://github.com/jes2412/20260311)

앞으로 코드를 수정한 뒤 아래처럼 커밋·푸시하면 됩니다.

```bash
git add .
git commit -m "변경 내용 설명"
git push origin main
```

최초 1회만 원격이 없다면: `git remote add origin https://github.com/jes2412/20260311.git`

## Supabase에 추첨 번호 저장

1. [Supabase](https://supabase.com)에서 프로젝트 생성
2. **SQL Editor**에서 `supabase-schema.sql` 내용 실행 (테이블 `lotto_draws` + RLS)
3. **Project Settings → API**에서 **Project URL**, **anon public** key 복사
4. **Vercel 배포 시** 대시보드 → **Settings → Environment Variables**에 다음을 추가 (Production / Preview 모두):
   - `SUPABASE_URL` = Supabase Project URL
   - `SUPABASE_ANON_KEY` = anon public key  
   저장 후 **Redeploy** 하면 됩니다. 페이지 로드 시 `api/config`가 환경변수를 내려주어 빌드 없이 동작합니다.
5. **번호 뽑기** 시 자동으로 해당 세트들이 `lotto_draws`에 insert 됩니다.

로컬에서 환경변수 없이 쓰려면 `config.js`는 기본 빈 값이며, 로컬에서 주입하려면 빌드 전에:

```bash
set SUPABASE_URL=https://xxx.supabase.co
set SUPABASE_ANON_KEY=eyJ...
npm run build
```

(`config.js`가 덮어써짐. Windows PowerShell은 `$env:SUPABASE_URL="..."` 형식)

## 참고

- 참고용이며 당첨을 보장하지 않습니다.
- 공 색상은 한국 로또 구간(1–9 노랑, 10–18 파랑, 19–27 빨강, 28–36 회색, 37–45 초록)에 맞춰 표시됩니다.
