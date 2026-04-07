#!/bin/bash

# UX Design Skills Installer for Claude Code
# Usage: ./install.sh [target-project-path]

set -e

TARGET="${1:-.}"
COMMANDS_DIR="${TARGET}/.claude/commands"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$COMMANDS_DIR"

count=0
for file in "$SCRIPT_DIR"/commands/*.md; do
  filename=$(basename "$file")
  cp "$file" "$COMMANDS_DIR/$filename"
  count=$((count + 1))
  echo "  ✓ $filename"
done

echo ""
echo "설치 완료! ${count}개 스킬이 ${COMMANDS_DIR}에 설치되었습니다."
echo ""
echo "사용법:"
echo "  /ux-design               — UX 설계 오케스트레이터 (전체 프로세스 안내)"
echo "  /1-ux-problem-definer    — 1단계: 문제 정의"
echo "  /2-ux-flow-designer      — 2단계: 흐름 설계"
echo "  /3-ux-audit              — 3단계: UX 감사"
echo "  /4-ux-prototype          — 4단계: 프로토타입"
echo "  /5-design-system         — 5단계: 디자인 시스템"
echo "  /6-screen-design         — 6단계: 화면 디자인"
echo "  /7-mvp-build             — 7단계: MVP 구현"
