---
name: 6-screen-design
description: 화면별 디자인 적용. 디자인 시스템을 화면별 UI 구조에 입혀 완성된 HTML 시안을 만든다. 트리거: 화면 시안, 화면 디자인, 디자인 적용, 화면 목업, 스크린 디자인.
---

# 6단계: 화면별 디자인 적용

5단계의 디자인 시스템을 **각 화면에 입혀** HTML 시안을 만든다. 코드 구현 전 "완성된 화면"을 먼저 확정.

**핵심 원칙**: 화면 1개씩 시안 → 피드백 → 확정 사이클. 한 번에 다 만들지 않는다.

공통 규칙(HTML 프리뷰, 대화 톤)은 `/ux-design` 참조.

## 사전 확인

필수 산출물:
- `design-system/` 폴더 — 5단계 (6개 파일)
- `ux-flow/` 폴더 — 2단계 (6개 파일)

없으면 해당 단계 먼저 안내.

**토큰 절약**: 아래 매핑된 파일을 **한 번씩만** read하고 그 내용을 바탕으로 작업. 같은 파일 반복 read 금지.

## 입력 자료 매핑

| 요소 | 출처 파일 |
|------|------|
| 화면 레이아웃, 컴포넌트 배치, 우선순위, 상태별 화면 | `ux-flow/04-screen-ui-structure.md` |
| 텍스트/문구 (UX 라이팅) | `ux-flow/05-global-components.md` |
| 사용할 컴포넌트 (variants, 상태) | `design-system/05-components.md` |
| 색상 토큰 | `design-system/02-colors.md` |
| 폰트 토큰 | `design-system/03-typography.md` |
| 스페이싱 토큰 | `design-system/04-spacing.md` |
| 아이콘 | `design-system/06-icons.md` |

## 진행 순서

### Step 1: 화면 목록 확정

`ux-flow.md` IA와 화면별 UI 구조에서 화면 추출. MVP 포함 여부와 우선순위 합의. "어느 화면부터 디자인할까요?" 보통 "홈"부터 시작 추천.

### Step 2: 화면별 디자인 적용

화면 1개씩:

**2-1. 설계도 확인** — `ux-flow.md` 해당 화면의 UI 구조 재확인 (레이아웃, 컴포넌트 배치, 우선순위, 인터랙션, 상태별 화면)

**2-2. 디자인 시스템 적용** — 사용할 컴포넌트·variants 선택, 토큰(CSS 변수) 적용, 아이콘 선택

**2-3. HTML 프리뷰** — `design-preview/screens/[화면명].html` 생성
- 디자인 시스템 토큰(CSS 변수) 적용
- Phase 5 컴포넌트 조합
- **상태별 화면 모두 포함** (데이터 있음/빈/로딩/에러)
- 모바일/데스크톱 반응형
- 실제 서비스 맥락 텍스트
- `ux-flow.md` UX 라이팅 톤앤매너 반영

**2-4. 피드백** — 레이아웃/컴포넌트/토큰/상태/톤앤매너 확인.

**수정 경로 2가지**:
- 화면만 수정 → 이 단계 내에서
- 디자인 시스템 자체 수정 → `/5-design-system` Phase로 돌아가기

**확정 시** `design-system.md`의 "화면별 디자인" 섹션에 해당 화면 구성 요소 기록 (사용 컴포넌트, 주요 상태, 레이아웃).

### Step 3: 화면 간 연결 프리뷰

`design-preview/screens/index.html` — 각 화면 썸네일(iframe/스크린샷) + 이름, 클릭 시 열림, 화면 간 이동 흐름 표시.

**선택**: 사용자 흐름별 시나리오 뷰 (예: 구매 흐름 — 홈→검색→상세→결제)

## 결과물

```
design-preview/
├── colors.html, typography.html, components.html  (5단계)
└── screens/                                        (6단계)
    ├── index.html
    ├── home.html, login.html, mypage.html, ...
```

`design-system.md`에 "화면별 디자인" 섹션 추가.

## CLAUDE.md 업데이트

- 진행 상태에서 6단계 ✅로 표시
- 산출물 인덱스에 `design-preview/screens/` 추가
- 화면 시안 수정 사유(레이아웃 변경, 컴포넌트 교체 등)를 의사결정 로그에 기록

## 다음 단계

> "모든 화면 디자인 시안이 완성됐어요. 이제 이 디자인을 실제 동작하는 코드로 만들 차례예요. `/7-mvp-build`로 넘어갈까요?"

"디자인만 필요하고 코드는 나중에"라고 하면 6단계에서 마무리.
