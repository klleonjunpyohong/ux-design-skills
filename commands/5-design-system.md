---
name: 5-design-system
description: 디자인 시스템 구축. 디자인 컨셉, 컬러, 폰트, 스페이싱, 컴포넌트 상세 스펙, 아이콘을 결정. 트리거: 디자인 시스템, 디자인 토큰, 컬러, 폰트, 컴포넌트 스펙, 디자인 컨셉.
---

# 5단계: 디자인 시스템 구축

디자인 시스템(토큰, 컴포넌트 스펙)을 구축한다. 화면 디자인이나 코드 구현은 하지 않는다.

**핵심 원칙**: **독단적으로 결정하지 않는다.** 모든 결정은 **추천 → 사용자 확인 → 반영** 사이클을 따른다. 각 Phase 확정 즉시 `design-system.md`에 해당 섹션 기록.

공통 규칙(HTML 프리뷰, 대화 톤)은 `/ux-design` 참조.

## 사전 확인

- `problem-definition.md`, `ux-flow.md` 읽기
- `ux-flow.md`의 공통 컴포넌트/화면별 UI 구조 → Phase 5 출발점
- `ux-audit-report.md`의 접근성·UI 이슈 → Phase 4/5에 반영

## 진행 순서

```
Phase 1: 컨셉 → Phase 2: 컬러 → Phase 3: 폰트 → Phase 4: 화면·스페이싱 → Phase 5: 컴포넌트 스펙 → Phase 6: 아이콘
```

---

## Phase 1: 디자인 컨셉

기획 문서 분석 후 전체 디자인 방향 제안.

**포함 항목**: 분위기 키워드, 참고 스타일(Material/iOS/글래스모피즘 등), 시각적 톤(둥근/각진, 그림자), 2~3가지 방향 제시.

**레퍼런스 입력 지원**:
- URL → WebFetch로 분석
- 스크린샷 → 시각적 특성 분석
- 없으면 기획서만으로 추천 가능

**대화 예시 (건강 관리 앱)**:
> A. 클린&트러스트 (병원 느낌), B. 웜&프렌들리 (일상 건강 앱), C. 다크&프리미엄 (피트니스 앱). 참고 앱/사이트 URL이나 스크린샷 공유해주셔도 돼요.

---

## Phase 2: 컬러

컨셉 기반 컬러 팔레트 제안.

**제안 항목** (모두 필수):
- Primary, Secondary, Accent
- Background (메인/카드)
- Text (제목/본문/보조)
- Semantic (Success/Warning/Error/Info)
- 다크 모드 지원 여부

**프리뷰**: `design-preview/colors.html` 생성. 각 컬러 박스(헥스/이름), 밝은/어두운 배경 위 텍스트 조합, 버튼 조합, 다크 모드 토글.

---

## Phase 3: 폰트

서비스 성격에 맞는 폰트 제안.

**제안 항목**:
- 제목(Heading), 본문(Body) 폰트
- 크기 체계 (h1~h6, body, caption, small)
- 굵기 (Regular/Medium/Bold)
- 줄간격 기준
- 한글/영문 각각 (Google Fonts 등 무료)

**프리뷰**: `design-preview/typography.html` — 크기별 샘플, 한글+영문+숫자 혼합, 굵기 비교, 실제 서비스 예시 문구.

---

## Phase 4: 화면 설정 & 스페이싱 시스템

**화면 설정**:
- 지원 디바이스 (모바일/태블릿/데스크톱)
- 브레이크포인트
- 디바이스별 레이아웃 전략 (1단/2단/사이드바)
- 모바일 vs 데스크톱 우선

**스페이싱 시스템** (4px 또는 8px 그리드):
```
--spacing-2xs: 2px    --spacing-xs: 4px     --spacing-sm: 8px
--spacing-md: 16px    --spacing-lg: 24px    --spacing-xl: 32px
--spacing-2xl: 48px   --spacing-3xl: 64px
```

용도: 컴포넌트 내부 패딩(xs~md), 컴포넌트 간(md~lg), 섹션 간(xl~3xl), 화면 좌우(md~lg)

**접근성 기준** (필수):
- 최소 터치 영역 44x44px
- 텍스트 색상 대비 4.5:1 이상 (WCAG AA)
- 모든 인터랙티브 요소에 포커스 링

표/목록으로 정리해서 보여주고 확인.

---

## Phase 5: 컴포넌트 상세 스펙

컬러·폰트·스페이싱 조합으로 기본 UI 컴포넌트를 **상세 스펙까지** 정의.

**이전 산출물 활용**: `ux-flow.md`의 공통 컴포넌트·화면별 UI 구조에서 필요한 컴포넌트를 추출해 목록 구성.

### Step 1: 컴포넌트 목록

일반적으로 포함: 버튼, 입력 필드, 카드, 네비게이션 바, 모달/팝업, 리스트 아이템, 탭, 뱃지/태그, 토스트/알림

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
- Outline: bg=transparent, border 1px --color-border
- Text: bg=transparent, text=--color-primary

**c) 상태**: default, hover(opacity 0.9), active(scale 0.98), disabled(opacity 0.4), focus(outline 2px)

**d) Props**: size(sm/md/lg), variant(primary/secondary/outline/text), leftIcon, rightIcon, fullWidth, loading

**e) 접근성**: 44x44px 터치 영역, aria 속성, 키보드 포커스

모든 컴포넌트에 위 5가지를 정의. 수치는 Phase 2/3/4 토큰 참조.

### Step 3: HTML 프리뷰

`design-preview/components.html` — 각 컴포넌트의 variants × 사이즈 × 상태 한눈에, 각 variant 옆에 상세 스펙(수치) 표시, 모바일/데스크톱 프리뷰, 실제 서비스 맥락 텍스트.

---

## Phase 6: 아이콘

1. 기획서 기반 필요 아이콘 목록 작성
2. 무료 라이브러리 매칭 (Lucide/Heroicons/Phosphor 중 하나로 통일)
3. 라이브러리에 없는 아이콘 → SVG 직접 제작
4. 확인받기

---

## 결과물

`design-system.md`에 다음 섹션 모두 포함:
- 디자인 컨셉, 컬러 팔레트, 타이포그래피, 화면 설정&스페이싱, 컴포넌트 상세 스펙, 아이콘

`design-preview/` 폴더: colors.html, typography.html, components.html

## 다음 단계

> "디자인 시스템 구축이 완료됐어요. 이제 이 시스템을 각 화면에 실제로 적용해서 화면 시안을 만들 차례예요. `/6-screen-design`으로 넘어갈까요?"
