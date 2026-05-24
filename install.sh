#!/usr/bin/env bash
# install.sh
# Installer for Creative People client onboarding workshop.
# Copies the 5 bundled Claude Code Skills into ~/.claude/skills/
# and prints next-step instructions for MCPs + Apify token.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="$HOME/.claude/skills"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${BOLD}Creative People · Workshop Installer${NC}"
echo "====================================="
echo ""

# ----- Step 1: verify Claude Code -----
if ! command -v claude &>/dev/null; then
  echo -e "${RED}Claude Code לא מותקן.${NC}"
  echo "התקיני אותו תחילה: https://docs.claude.com/claude-code/install"
  exit 1
fi
echo -e "${GREEN}✓${NC} Claude Code: $(claude --version)"

# ----- Step 2: install 5 Skills -----
mkdir -p "$TARGET"

SKILLS=(
  "hebrew-content-writer"
  "hebrew-writer"
  "hebrew-document-generator"
  "impeccable"
  "skill-creator"
)

echo ""
echo "מתקין 5 סקילים ל-$TARGET ..."
for skill in "${SKILLS[@]}"; do
  src="$SCRIPT_DIR/skills/$skill"
  dst="$TARGET/$skill"
  if [ ! -d "$src" ]; then
    echo -e "  ${RED}✗${NC} $skill (חסר ב-repo)"
    continue
  fi
  if [ -d "$dst" ]; then
    # Back up existing skill before overwriting
    backup="$dst.backup-$(date +%Y%m%d-%H%M%S)"
    mv "$dst" "$backup"
    echo -e "  ${YELLOW}↻${NC} $skill (קיים, גיבוי: $(basename $backup))"
  fi
  cp -r "$src" "$dst"
  echo -e "  ${GREEN}✓${NC} $skill"
done

# ----- Step 3: MCP setup hint -----
echo ""
echo -e "${BOLD}שלב הבא — MCPs${NC}"
echo "ה-MCPs מוגדרים ברמת פרויקט (.mcp.json) ולא גלובלית."
echo "כשתתחילי לעבוד על לקוח, צרי בתיקיית הפרויקט קובץ .mcp.json:"
echo ""
echo "  cp $SCRIPT_DIR/.mcp.json.example /path/to/client-project/.mcp.json"
echo ""
echo "ואז ערכי את הקובץ והחליפי את {{APIFY_TOKEN}} בטוקן האמיתי שלך."
echo "טוקן Apify: https://console.apify.com/account/integrations"

# ----- Step 4: bash tools check -----
echo ""
echo -e "${BOLD}בדיקת כלי bash${NC}"
for tool in yt-dlp ffmpeg whisper git node; do
  if command -v $tool &>/dev/null; then
    echo -e "  ${GREEN}✓${NC} $tool"
  else
    echo -e "  ${RED}✗${NC} $tool (חסר — ראי PRE-WORKSHOP-PREP.md)"
  fi
done

echo ""
echo -e "${GREEN}${BOLD}סיום ההתקנה.${NC}"
echo ""
echo "צעדים אחרונים לפני הסדנה:"
echo "  1. אם כלי bash חסרים — התקיני אותם לפי PRE-WORKSHOP-PREP.md"
echo "  2. הכניסי Apify token ל-.mcp.json של פרויקט הלקוח"
echo "  3. ודאי שיש לך intake PDF של לקוחה אמיתית מוכן"
echo "  4. בסדנה — נבנה את המערכת יחד מ-0 דרך BUILD-SYSTEM.md"
echo ""
