# UX Design Skills for Claude Code

Claude Code에서 사용할 수 있는 UX 설계 스킬 모음입니다.  
4단계 프로세스로 **문제 정의 → 흐름 설계 → UX 감사 → 프로토타입**까지 체계적으로 진행합니다.

---

## Quick Start

### 1. 설치

```bash
# 레포 클론
git clone https://github.com/klleonjunpyohong/ux-design-skills.git

# 설치 스크립트 실행 (자기 프로젝트 경로를 넣어주세요)
cd ux-design-skills
chmod +x install.sh
./install.sh /path/to/your/project
```

설치하면 프로젝트의 `.claude/commands/` 폴더에 스킬 파일이 복사됩니다.

> 수동으로 하려면: `cp commands/*.md /your-project/.claude/commands/`

### 2. 사용

Claude Code에서 아래 명령어를 입력하면 됩니다:

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
```

### 3. 요구사항

- [Claude Code](https://claude.ai/claude-code) (CLI, 데스크톱 앱, 웹 앱, 또는 IDE 확장)

---

## 프로세스 개요

```
1단계: 문제 정의  →  2단계: 흐름 설계  →  3단계: UX 감사  →  4단계: 프로토타입
(/1-ux-problem-definer) (/2-ux-flow-designer)   (/3-ux-audit)      (/4-ux-prototype)
```

각 단계가 끝나면 자동으로 다음 단계를 안내합니다.  
감사에서 문제가 발견되면 이전 단계로 돌아가는 이터레이션도 지원합니다.

| 단계 | 명령어 | 하는 일 | 산출물 |
|------|--------|---------|--------|
| - | `/ux-design` | 전체 프로세스 안내 (오케스트레이터) | - |
| 1 | `/1-ux-problem-definer` | 대화형 질문으로 문제 정의 | `problem-definition.md` |
| 2 | `/2-ux-flow-designer` | 흐름, IA, UI 구조, UX 라이팅 설계 | `ux-flow.md` |
| 3 | `/3-ux-audit` | 8가지 관점으로 UX 검토 | `ux-audit-report.md` |
| 4 | `/4-ux-prototype` | HTML 프로토타입 생성 | `prototype/` 폴더 |

---

## 각 단계 상세

### 1단계: 문제 정의 (`/1-ux-problem-definer`)

대화를 통해 "무엇을 왜 만드는지" 명확히 합니다.

- 새 서비스 설계 / 기존 서비스 개선 모두 지원
- **페르소나**: 연령, 직업, JTBD(Jobs to be Done), 사용 빈도
- **경쟁 서비스 벤치마킹**: URL 분석, 강점/약점, 차별점
- 핵심 기능 (MVP vs 확장), 제약 조건, 성공 기준

### 2단계: 흐름 설계 (`/2-ux-flow-designer`)

6가지 산출물을 생성합니다:

1. **User Flow** — 단계별 사용자 흐름도 (분기 포함)
2. **Edge Cases** — 예외 케이스와 대응 방안
3. **Information Architecture** — 화면 간 계층 구조
4. **Screen UI Structure** — 화면별 레이아웃, 컴포넌트 배치, 콘텐츠 우선순위, 인터랙션 패턴, 상태별 화면 (빈 상태/로딩/에러)
5. **Global Components & UX Writing** — 공통 컴포넌트 (네비, 토스트 등), 톤앤매너, CTA/에러 메시지 패턴
6. **Test Cases** — 검증 시나리오

### 3단계: UX 감사 (`/3-ux-audit`)

8가지 관점으로 설계를 검토합니다:

1. 이탈 지점 분석 (위험도 상/중/하)
2. 접근성 검토 (시각, 운동, 인지, 상황)
3. 빠진 흐름 확인 (온보딩, 에러 복구, 빈 상태)
4. 일관성 검토 (패턴, 용어, 네비게이션)
5. UI 구조 검토 (레이아웃, 컴포넌트, 상태별 화면)
6. 닐슨 10가지 휴리스틱 평가 (체크리스트)
7. 사용자 감정 곡선

### 4단계: 프로토타입 (`/4-ux-prototype`)

브라우저에서 바로 확인할 수 있는 HTML 프로토타입을 만듭니다:

- 2단계의 UI 구조를 설계도로 사용하여 구현
- CSS 변수 시스템으로 일관된 스타일
- A/B 변형안 포함
- 접근성 반영 (색상 대비, 터치 영역, alt 텍스트)

---

## 이터레이션

일방향이 아니라 필요에 따라 이전 단계로 돌아갈 수 있습니다:

| 상황 | 돌아갈 단계 |
|------|-----------|
| 감사에서 심각한 흐름 문제 발견 | → 2단계 (`/2-ux-flow-designer`) |
| 감사에서 문제 정의 자체가 흔들림 | → 1단계 (`/1-ux-problem-definer`) |
| 프로토타입 보고 흐름 변경 필요 | → 2단계 (`/2-ux-flow-designer`) |

---

## 파일 구조

```
commands/
├── ux-design.md              ← 오케스트레이터
├── 1-ux-problem-definer.md   ← 1단계: 문제 정의
├── 2-ux-flow-designer.md     ← 2단계: 흐름 설계
├── 3-ux-audit.md             ← 3단계: UX 감사
└── 4-ux-prototype.md         ← 4단계: 프로토타입
```

설치하면 위 파일들이 프로젝트의 `.claude/commands/`에 복사됩니다.

## License

MIT
