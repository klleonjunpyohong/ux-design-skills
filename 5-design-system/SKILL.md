---
name: 5-design-system
description: 디자인 시스템 구축. 디자인 컨셉, 컬러, 폰트, 스페이싱, 컴포넌트 상세 스펙, 아이콘을 결정. 트리거: 디자인 시스템, 디자인 토큰, 컬러, 폰트, 컴포넌트 스펙, 디자인 컨셉.
---

# 5단계: 디자인 시스템 구축

디자인 시스템(토큰, 컴포넌트 스펙)을 6개 Phase로 구축한다. 화면 디자인이나 코드 구현은 하지 않는다.

**핵심 원칙**: **추천 → 사용자 확인 → 반영** 사이클. 독단 결정 금지.

공통 규칙(HTML 프리뷰, 대화 톤, **토큰 절약 — 다른 파일 read 금지**)은 `/ux-design` 참조.

## 사전 확인

- `problem-definition.md` 읽기 (한 번만)
- `ux-flow/05-global-components.md` 읽기 (공통 컴포넌트 출발점) — Phase 5 시작 시에만
- `ux-audit-report.md` 읽기 (접근성·UI 이슈 반영) — Phase 4/5 시작 시에만

이 외에는 다른 파일 read 금지.

## 산출물 폴더 구조 (★ 토큰 절약)

`design-system/` 폴더에 6개 파일로 분리. **각 Phase는 자기 파일만 작성하고, 이전 Phase 파일은 다시 읽지 않는다.**

```
design-system/
├── 01-concept.md       ← 디자인 컨셉
├── 02-colors.md        ← 컬러 팔레트
├── 03-typography.md    ← 폰트 & 타이포그래피
├── 04-spacing.md       ← 화면 설정 & 스페이싱
├── 05-components.md    ← 컴포넌트 상세 스펙
└── 06-icons.md         ← 아이콘
```

## 작성 원칙

1. 각 Phase 결과는 **새 파일로 Write**
2. 다른 Phase 파일을 **다시 read하지 않는다**
3. 이전 Phase의 결정사항이 필요하면 **사용자에게 물어봄** ("Phase 2의 Primary 컬러가 뭐였죠?")
4. 또는 사용자가 답한 내용을 그대로 활용 (이미 컨텍스트에 있음)

---

## Phase 1 → `01-concept.md`

기획 문서 분석 후 디자인 방향 제안.

**포함 항목**: 분위기 키워드, 참고 스타일(Material/iOS/글래스모피즘 등), 시각적 톤(둥근/각진, 그림자), 2~3가지 방향 제시.

**레퍼런스 입력 지원**: URL → WebFetch / 스크린샷 → 이미지 분석 / 없으면 기획서만으로 추천.

**대화 예시 (건강 관리 앱)**:
> A. 클린&트러스트 (병원), B. 웜&프렌들리 (일상 건강), C. 다크&프리미엄 (피트니스). URL이나 스크린샷 공유해주셔도 돼요.

---

## Phase 2 → `02-colors.md`

Phase 1 컨셉 기반 컬러 팔레트.

**제안 항목** (모두 필수):
- Primary, Secondary, Accent
- Background (메인/카드)
- Text (제목/본문/보조)
- Semantic (Success/Warning/Error/Info)
- 다크 모드 지원 여부

**프리뷰**: `design-preview/colors.html` — 컬러 박스(헥스/이름), 텍스트 조합, 버튼 조합, 다크 모드 토글.

---

## Phase 3 → `03-typography.md`

**제안 항목**:
- Heading, Body 폰트
- 크기 체계 (h1~h6, body, caption, small)
- 굵기 (Regular/Medium/Bold)
- 줄간격
- 한글/영문 (Google Fonts 등 무료)

**프리뷰**: `design-preview/typography.html` — 크기별/굵기별 샘플, 한글+영문+숫자 혼합.

---

## Phase 4 → `04-spacing.md`

**화면 설정**: 지원 디바이스, 브레이크포인트, 디바이스별 레이아웃 전략, 모바일 vs 데스크톱 우선

**스페이싱 시스템** (4px/8px 그리드):
```
--spacing-2xs: 2px    --spacing-xs: 4px     --spacing-sm: 8px
--spacing-md: 16px    --spacing-lg: 24px    --spacing-xl: 32px
--spacing-2xl: 48px   --spacing-3xl: 64px
```

용도: 컴포넌트 내부 패딩(xs~md), 컴포넌트 간(md~lg), 섹션 간(xl~3xl), 화면 좌우(md~lg)

**접근성 기준** (필수):
- 최소 터치 영역 44x44px
- 색상 대비 4.5:1 이상 (WCAG AA)
- 모든 인터랙티브 요소에 포커스 링

표/목록으로 정리해서 확인.

---

## Phase 5 → `05-components.md`

기본 UI 컴포넌트를 **상세 스펙까지** 정의.

**이전 산출물 활용**: 시작 시 `ux-flow/05-global-components.md`를 한 번 읽어 공통 컴포넌트 목록 추출. 그 후로는 다시 read 안 함.

### Step 1: 컴포넌트 목록 (아토믹 디자인 분류)

5계층으로 분류:

**Atoms** — 버튼, 입력, 라벨, 아이콘, 배지, 체크박스, 라디오, 스위치, 아바타
**Molecules** — 검색바(입력+아이콘+버튼), 폼 필드(라벨+입력+에러), 카드 헤더, 토스트
**Organisms** — 네비게이션 바, 카드, 리스트 아이템, 모달, 폼, 헤더
**Templates** — 페이지 레이아웃 (콘텐츠 없는 뼈대)
**Pages** — 실제 화면 (6단계에서 다룸)

### Step 2: 각 컴포넌트의 상세 스펙 (5가지 필수)

**예시 — Button**:

**a) 사이즈 variants**
```
sm: height 32px, padding 8px 12px, font-size 13px, radius 6px
md: height 40px, padding 10px 16px, font-size 15px, radius 8px
lg: height 48px, padding 12px 20px, font-size 17px, radius 8px
```

**b) 스타일 variants + 토큰 매핑**
- Primary: bg=--color-primary, text=white
- Secondary: bg=--color-secondary, text=--color-text
- Outline: border 1px --color-border
- Text: text=--color-primary

**c) 상태**: default, hover, active, disabled, focus

**d) Props**: size, variant, leftIcon, rightIcon, fullWidth, loading

**e) 접근성**: 터치 영역 44x44px, aria 속성, 키보드 포커스

모든 컴포넌트에 위 5가지 정의. 수치는 Phase 2/3/4의 토큰 참조 (필요 시 사용자에게 확인).

### Step 3: HTML 프리뷰

`design-preview/components.html` — variants × 사이즈 × 상태 한눈에, 모바일/데스크톱 프리뷰.

---

## Phase 6 → `06-icons.md`

1. 기획서 기반 필요 아이콘 목록
2. 무료 라이브러리 매칭 (Lucide/Heroicons/Phosphor 중 하나로 통일)
3. 라이브러리 없는 것 → SVG 직접 제작
4. 확인받기

---

## 결과물

`design-system/` 폴더에 6개 파일 + `design-preview/`의 colors.html, typography.html, components.html

## CLAUDE.md 업데이트

- 진행 상태에서 5단계 ✅로 표시
- 산출물 인덱스에 `design-system/` 추가
- 변경 사유는 `decisions.md`에 한 줄 append

## 다음 단계

> "디자인 시스템 구축이 완료됐어요. 이제 이 시스템을 각 화면에 적용해서 화면 시안을 만들 차례예요. `/6-screen-design`으로 넘어갈까요?"
