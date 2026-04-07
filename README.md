# UX Design Skills for Claude Code

Claude Code에서 사용할 수 있는 UX 설계 스킬 모음입니다.
7단계 프로세스로 **문제 정의 → 흐름 설계 → UX 감사 → 프로토타입 → 디자인 시스템 → 화면 디자인 → MVP 구현**까지 체계적으로 진행합니다.

---

## Quick Start

### 1. 설치

**방법 A: npx skills (추천)**

```bash
npx skills add https://github.com/klleonjunpyohong/ux-design-skills.git
```

**방법 B: 설치 스크립트**

```bash
git clone https://github.com/klleonjunpyohong/ux-design-skills.git
cd ux-design-skills
chmod +x install.sh
./install.sh /path/to/your/project
```

**방법 C: 수동 복사**

```bash
git clone https://github.com/klleonjunpyohong/ux-design-skills.git
cp ux-design-skills/commands/*.md /your-project/.claude/commands/
```

### 2. 사용

Claude Code에서 아래 명령어 입력:

```
/ux-design
```

오케스트레이터가 현재 상태를 파악하고 적절한 단계부터 안내합니다.
개별 단계를 직접 실행할 수도 있습니다:

```
/1-ux-problem-definer    # 1단계: 문제 정의
/2-ux-flow-designer      # 2단계: 흐름 설계
/3-ux-audit              # 3단계: UX 감사
/4-ux-prototype          # 4단계: 프로토타입
/5-design-system         # 5단계: 디자인 시스템
/6-screen-design         # 6단계: 화면 디자인
/7-mvp-build             # 7단계: MVP 코드 구현
```

### 3. 요구사항

- [Claude Code](https://claude.ai/claude-code)

---

## 프로세스 개요

```
1: 문제 정의 → 2: 흐름 설계 → 3: UX 감사 → 4: 프로토타입 → 5: 디자인 시스템 → 6: 화면 디자인 → 7: MVP 구현
```

각 단계는 독립적으로 동작하며, 앞 단계의 산출물을 입력으로 받습니다.
감사에서 문제가 발견되면 이전 단계로 돌아가는 이터레이션도 지원합니다.

| 단계 | 스킬 | 결과물 |
|------|------|--------|
| - | `/ux-design` | 오케스트레이터 (전체 안내) |
| 1 | `/1-ux-problem-definer` | `problem-definition.md` |
| 2 | `/2-ux-flow-designer` | `ux-flow.md` |
| 3 | `/3-ux-audit` | `ux-audit-report.md` |
| 4 | `/4-ux-prototype` | `prototype/` |
| 5 | `/5-design-system` | `design-system.md` + `design-preview/` |
| 6 | `/6-screen-design` | `design-preview/screens/` |
| 7 | `/7-mvp-build` | MVP 코드 |

---

## 단계 그룹

필요한 그룹만 진행 가능합니다:

- **그룹 A: UX 설계 (1~4)** — 문제 정의부터 프로토타입까지. 여기까지만 해도 설계서로 활용 가능
- **그룹 B: 디자인 (5~6)** — 디자인 시스템 + 화면 시안. 코드 구현 전 디자인만 필요할 때
- **그룹 C: 구현 (7)** — 실제 동작하는 MVP 코드

---

## 각 단계 상세

### 1단계: 문제 정의 (`/1-ux-problem-definer`)

대화를 통해 "무엇을 왜 만드는지" 명확히 합니다.

- 새 서비스 설계 / 기존 서비스 개선 지원
- **페르소나**: 연령, 직업, JTBD, 사용 빈도
- **경쟁 서비스 벤치마킹**: URL 분석, 강점/약점, 차별점
- 핵심 기능, 제약 조건, 성공 기준

### 2단계: 흐름 설계 (`/2-ux-flow-designer`)

6가지 산출물 생성:

1. **User Flow** — 단계별 사용자 흐름도
2. **Edge Cases** — 예외 케이스와 대응 방안
3. **Information Architecture** — 화면 간 계층 구조
4. **Screen UI Structure** — 화면별 레이아웃, 컴포넌트, 우선순위, 상태별 화면
5. **Global Components & UX Writing** — 공통 컴포넌트, 톤앤매너, CTA/에러 메시지
6. **Test Cases** — 검증 시나리오

### 3단계: UX 감사 (`/3-ux-audit`)

8가지 관점으로 설계 검토:

1. 이탈 지점 분석 (위험도 상/중/하)
2. 접근성 검토 (시각/운동/인지/상황)
3. 빠진 흐름 확인
4. 일관성 검토
5. UI 구조 검토
6. 닐슨 10가지 휴리스틱 평가
7. 사용자 감정 곡선

### 4단계: 프로토타입 (`/4-ux-prototype`)

브라우저에서 바로 확인할 수 있는 HTML 프로토타입:

- 2단계 UI 구조를 설계도로 사용
- CSS 변수 시스템
- A/B 변형안 포함
- 접근성 반영

### 5단계: 디자인 시스템 (`/5-design-system`)

디자인 시스템을 6개 Phase로 구축:

| Phase | 내용 | 산출물 |
|-------|------|--------|
| 1 | 디자인 컨셉 | 컨셉 키워드 |
| 2 | 컬러 팔레트 | `colors.html` |
| 3 | 폰트 & 타이포그래피 | `typography.html` |
| 4 | 화면 설정 & 스페이싱 | - |
| 5 | 컴포넌트 상세 스펙 (variants, 상태, props, 접근성) | `components.html` |
| 6 | 아이콘 | - |

접근성 기준 (색상 대비 4.5:1, 터치 영역 44px) 포함.

### 6단계: 화면 디자인 (`/6-screen-design`)

디자인 시스템을 각 화면에 적용한 HTML 시안:

- `ux-flow.md`의 UI 구조 + `design-system.md`의 컴포넌트 조합
- 화면 1개씩 시안 → 피드백 → 확정
- 상태별 화면 (데이터 있음/빈/로딩/에러) 포함
- `design-preview/screens/index.html`로 전체 한눈에 보기

### 7단계: MVP 구현 (`/7-mvp-build`)

디자인 시스템과 시안을 실제 동작 코드로:

- 기술 스택 논의 (Next.js / Vite / Vanilla 등)
- 디자인 토큰 → CSS 변수 적용
- 컴포넌트 상세 스펙 → 코드 구현
- 화면 시안 → 프레임워크 컴포넌트
- 네비게이션 & 반응형

---

## 이터레이션

일방향이 아니라 필요에 따라 이전 단계로 돌아갈 수 있습니다:

| 상황 | 돌아갈 단계 |
|------|-----------|
| 3단계 감사에서 흐름 문제 발견 | → 2단계 |
| 감사에서 문제 정의 흔들림 | → 1단계 |
| 4단계 프로토타입 후 흐름 변경 필요 | → 2단계 |
| 6단계 화면 디자인에서 컴포넌트/컬러 부족 | → 5단계 |
| 7단계 MVP 구현 중 디자인 수정 필요 | → 5/6단계 |

---

## 파일 구조

```
ux-design/SKILL.md              ← 오케스트레이터 (공통 규칙 포함)
1-ux-problem-definer/SKILL.md   ← 1단계: 문제 정의
2-ux-flow-designer/SKILL.md     ← 2단계: 흐름 설계
3-ux-audit/SKILL.md             ← 3단계: UX 감사
4-ux-prototype/SKILL.md         ← 4단계: 프로토타입
5-design-system/SKILL.md        ← 5단계: 디자인 시스템
6-screen-design/SKILL.md        ← 6단계: 화면 디자인
7-mvp-build/SKILL.md            ← 7단계: MVP 구현
commands/                       ← 수동 설치용 (동일 내용)
install.sh                      ← 설치 스크립트
```

## License

MIT
