---
name: 7-mvp-build
description: MVP 코드 구현. 디자인 시스템과 화면 시안을 기반으로 실제 동작하는 MVP 코드를 만든다. 트리거: MVP 만들어줘, 코드 구현, MVP 빌드, 실제 앱 만들기, 디자인을 코드로.
---

# 7단계: MVP 코드 구현

디자인 시스템과 화면 디자인 시안을 **실제 동작하는 MVP 코드**로 옮긴다.

**핵심 원칙**: 이 단계에서 디자인 결정을 **새로 하지 않는다.** 디자인 수정이 필요하면 5단계 또는 6단계로 돌아간다.

공통 규칙(대화 톤)은 `/ux-design` 참조.

## 사전 확인

필수 산출물:
- `design-system.md` — 디자인 토큰, 컴포넌트 상세 스펙
- `design-preview/screens/` — 화면 시안
- `ux-flow.md` — User Flow (화면 간 이동), Test Cases

`ux-audit-report.md`가 있으면 감사 이슈 반영.

## 진행 순서

```
Step 1: 기술 스택 → Step 2: 프로젝트 구조 → Step 3: 디자인 토큰 적용
  → Step 4: 컴포넌트 구현 → Step 5: 화면 구현 → Step 6: 네비게이션 & 반응형
```

---

### Step 1: 기술 스택 논의

논의 항목: 프레임워크, 스타일링, 상태 관리, 라우팅, 빌드 도구

**원칙**:
- 사용자가 이미 쓰는 기술 우선
- 특별한 선호 없으면 프로젝트에 적합한 것 추천 + 이유 설명
- 쉬운 말로 설명 (기술 용어 최소화)

예: 모바일 중심 웹앱이면 "Next.js + Tailwind (일반적, 배포 쉬움)" vs "Vite + React + CSS Variables (가벼움)" vs "Vanilla HTML/CSS/JS (의존성 없음)" 선택지 제시.

---

### Step 2: 프로젝트 구조 설정

폴더 구조를 먼저 보여주고 확인받는다. 일반 구조:
- `src/styles/tokens.css` — 디자인 토큰
- `src/components/` — 컴포넌트 (Button/Input/Card 등)
- `src/app/` 또는 `src/pages/` — 화면 (라우팅)
- `src/lib/` — 유틸리티

---

### Step 3: 디자인 토큰 적용

`design-system.md`의 토큰을 CSS 변수로 선언:
- Colors (Primary, Secondary, Background, Text, Semantic)
- Spacing scale (xs~3xl)
- Typography (family, size, weight, line-height)
- Radius
- Breakpoints

다크 모드 지원 시 `[data-theme="dark"]` 또는 `prefers-color-scheme`으로 오버라이드.

---

### Step 4: 컴포넌트 코드 구현

`design-system.md`의 컴포넌트 상세 스펙을 그대로 반영:
- 사이즈 variants (sm/md/lg)
- 스타일 variants (primary/secondary/outline)
- 상태 (default/hover/active/disabled/focus)
- Props
- 접근성 (aria-*, 키보드)

**원칙**:
- 디자인 토큰(CSS 변수) 직접 사용, **하드코딩 금지**
- 우선순위: 공통 컴포넌트(버튼/입력/카드/네비) → 화면 전용 컴포넌트

---

### Step 5: 화면 코드 구현

`design-preview/screens/` 시안을 기반으로 화면 1개씩:

1. 시안의 HTML 구조 → 프레임워크 컴포넌트 구조로 변환
2. 하드코딩 스타일 → CSS 변수 기반으로
3. 정적 텍스트 → 실제 데이터/상태로 동적 처리
4. **상태별 렌더링** 구현 (`ux-flow.md`의 데이터 있음/빈/로딩/에러)
5. 화면별 체크포인트로 사용자 확인

---

### Step 6: 네비게이션 & 반응형

**네비게이션** (`ux-flow.md` User Flow 기반):
- 라우터 설정
- 버튼/링크 이동 경로
- 뒤로가기/취소 처리
- 딥링크 (필요 시)

**반응형** (`design-system.md` 브레이크포인트 기준):
- 모바일 우선 작성
- 브레이크포인트에서 레이아웃 전환
- 터치 영역 44px 유지
- 폰트/간격 조정

---

## 테스트 및 검증

`ux-flow.md` Test Cases 기준:
- 정상 흐름 완료
- 예외 케이스 (네트워크, 빈 데이터)
- 접근성 (키보드 내비, 색상 대비, 포커스)
- 반응형 (모든 브레이크포인트)

## 완료 안내

> "MVP 제작 완료!
> - 프로젝트 코드: `[경로]`
> - 디자인 시스템: `design-system.md`
> - 디자인 프리뷰: `design-preview/`
>
> 실행: `cd [경로] && [명령]`
>
> 수정이 필요하면: 디자인은 5/6단계로, 기능은 여기서 바로."
