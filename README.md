# UX Design Skills for Claude Code

Claude Code에서 사용할 수 있는 UX 설계 스킬 모음입니다. 4단계 프로세스로 **문제 정의 → 흐름 설계 → UX 감사 → 프로토타입**까지 체계적으로 진행합니다.

## 프로세스 개요

```
1단계: 문제 정의  →  2단계: 흐름 설계  →  3단계: UX 감사  →  4단계: 프로토타입
(/1-ux-problem-definer) (/2-ux-flow-designer)   (/3-ux-audit)      (/4-ux-prototype)
```

`/ux-design` 오케스트레이터가 전체 프로세스를 안내합니다.

## 각 단계별 기능

| 단계 | 명령어 | 하는 일 | 산출물 |
|------|--------|---------|--------|
| - | `/ux-design` | 전체 프로세스 안내 (오케스트레이터) | - |
| 1 | `/1-ux-problem-definer` | 대화형 질문으로 문제 정의 | `problem-definition.md` |
| 2 | `/2-ux-flow-designer` | 흐름, IA, UI 구조, 테스트 케이스 설계 | `ux-flow.md` |
| 3 | `/3-ux-audit` | 8가지 관점으로 UX 검토 | `ux-audit-report.md` |
| 4 | `/4-ux-prototype` | HTML 프로토타입 생성 | `prototype/` 폴더 |

### 1단계: 문제 정의
- 새 서비스 / 기존 서비스 개선 모두 지원
- 페르소나 (JTBD 포함), 경쟁 서비스 벤치마킹
- 핵심 기능, 제약 조건, 성공 기준 정의

### 2단계: 흐름 설계 (6가지 산출물)
1. **User Flow** — 단계별 사용자 흐름도
2. **Edge Cases** — 예외 케이스와 대응 방안
3. **Information Architecture** — 화면 간 계층 구조
4. **Screen UI Structure** — 화면별 레이아웃, 컴포넌트, 상태별 화면
5. **Global Components & UX Writing** — 공통 컴포넌트, 톤앤매너, CTA/에러 메시지 가이드
6. **Test Cases** — 검증 시나리오

### 3단계: UX 감사 (8가지 관점)
1. 이탈 지점 분석
2. 접근성 검토
3. 빠진 흐름 확인
4. 일관성 검토
5. UI 구조 검토
6. 닐슨 10가지 휴리스틱 평가
7. 사용자 감정 곡선

### 4단계: 프로토타입
- UI 구조 기반 HTML 구현
- CSS 변수 시스템으로 일관된 스타일
- A/B 변형안 포함
- 접근성 반영

## 설치

### 방법 1: 설치 스크립트 (추천)

```bash
git clone https://github.com/klleonjunpyohong/ux-design-skills.git
cd ux-design-skills
chmod +x install.sh
./install.sh /path/to/your/project
```

### 방법 2: 수동 복사

```bash
git clone https://github.com/klleonjunpyohong/ux-design-skills.git
cp ux-design-skills/commands/*.md /your-project/.claude/commands/
```

## 사용법

Claude Code에서 아래 명령어를 입력하면 됩니다:

```
# 전체 프로세스 시작 (추천)
/ux-design

# 또는 개별 단계 직접 실행
/1-ux-problem-definer
/2-ux-flow-designer
/3-ux-audit
/4-ux-prototype
```

## 이터레이션

일방향이 아니라 필요에 따라 이전 단계로 돌아갈 수 있습니다:

| 상황 | 돌아갈 단계 |
|------|-----------|
| 감사에서 심각한 흐름 문제 발견 | → 2단계 |
| 감사에서 문제 정의 자체가 흔들림 | → 1단계 |
| 프로토타입 보고 흐름 변경 필요 | → 2단계 |

## 요구사항

- [Claude Code](https://claude.ai/claude-code) CLI 또는 IDE 확장

## License

MIT
