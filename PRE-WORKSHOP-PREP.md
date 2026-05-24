# הכנה לסדנה — Creative People Client Onboarding

**שלום!** עוד יומיים-שלושה ניפגש לסדנת בנייה של מערכת אונבורדינג לקוחות. המסמך הזה הוא הצ׳קליסט שלך לפני הסדנה.

**זמן משוער להתקנה: 30-45 דקות.**

**עקרון חשוב**: בסדנה עצמה לא נעשה הדגמה ולא נריץ דמו מוכן. נבנה את המערכת **יחד אצלך, מ-0**, על לקוחה אמיתית שתביאי. לכן ההכנה הזו קריטית — בלעדיה לא תוכלי להשתתף ביעילות.

---

## מה את עומדת להתקין?

| קטגוריה | פריט | למה |
|---|---|---|
| **Claude Code CLI** | התקנה גלובלית | המנוע של המערכת |
| **Bash tools** | yt-dlp, ffmpeg, whisper, git, node, chrome | ניתוח וידאו + תשתית |
| **חשבון Apify + token** | דרך apify.com | סקרייפינג של אינסטגרם, טיקטוק, פייסבוק |
| **MCPs (בתוך הפרויקט)** | Apify + Playwright | מתחברים ל-Claude Code דרך .mcp.json |
| **5 Skills של עברית ועיצוב** | מתוך ה-repo של הסדנה | ליטוש עברית + יצירת PDF + design system |
| **Repo הסדנה** | clone מ-GitHub | מביא את כל הקבצים שתצטרכי |

---

## שלב 1 · התקנת Claude Code

### macOS

```bash
# התקנה דרך npm (דורש Node.js, אם אין — מותקן בשלב 2)
npm install -g @anthropic-ai/claude-code

# או דרך installer רשמי:
curl -fsSL https://docs.claude.com/claude-code/install.sh | bash
```

### בדיקה

```bash
claude --version
# אמור להחזיר משהו כמו: 2.1.85 (Claude Code)
```

### לוגין עם חשבון Pro/Max

```bash
claude login
```

- ייפתח דפדפן
- היכנסי עם חשבון ה-Claude Pro/Max שלך
- אישור OAuth → סיום

**שימי לב**: לא צריך Anthropic API key. Claude Code עובד דרך OAuth של חשבון Pro/Max.

---

## שלב 2 · התקנת כלי Bash

### macOS — דרך Homebrew

```bash
# אם אין Homebrew:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# כלים נחוצים:
brew install git node yt-dlp ffmpeg
brew install --cask google-chrome

# Whisper (תמלול וידאו) — דרך pip:
pip3 install -U openai-whisper
```

### Windows / Linux

ראי את ההוראות המקבילות באתרי הפרויקטים:
- yt-dlp: https://github.com/yt-dlp/yt-dlp/wiki/Installation
- ffmpeg: https://ffmpeg.org/download.html
- whisper: `pip install -U openai-whisper`

### בדיקה

```bash
git --version
node --version
yt-dlp --version
ffmpeg -version
whisper --help
```

כל הפקודות חייבות להחזיר תוצאה. אם משהו נכשל — פני אליי 48 שעות לפני הסדנה.

---

## שלב 3 · חשבון Apify + Token

1. הירשמי ב-https://apify.com/sign-up (חינמי, יש credit מתנה)
2. אחרי הרישום, היכנסי ל-**Settings → Integrations → API tokens**
3. לחצי על **+ Create new token** וקראי לו `workshop`
4. **העתיקי את הטוקן ושמרי אותו במקום בטוח** — תזדקקי לו בשלב 5

> תקציב: ריצה אחת של אונבורדינג עולה $5-15 ב-Apify. ה-credit ההתחלתי החינמי אמור להספיק.

---

## שלב 4 · Clone של Repo הסדנה

```bash
# בחרי תיקייה שנוחה לך:
cd ~/Desktop

# Clone:
git clone https://github.com/shonho159-source/creative-people-workshop.git
cd creative-people-workshop

# הריצי את ה-installer:
./install.sh
```

ה-installer:
- מעתיק את 5 הסקילים ל-`~/.claude/skills/` (אם קיימים בגרסה שונה — מגבה את הקיימים)
- בודק שכלי bash מותקנים
- מדפיס הוראות לשלב הבא

---

## שלב 5 · MCPs (Apify + Playwright)

ה-MCPs **לא** מותקנים גלובלית. הם מוגדרים ברמת פרויקט דרך קובץ `.mcp.json`.

### יצירת קובץ MCP בפרויקט הלקוח הראשון שלך

```bash
# צרי תיקייה ללקוחה הראשונה שלך (תוכלי לעשות גם בסדנה):
mkdir -p ~/Desktop/my-first-client
cd ~/Desktop/my-first-client

# העתיקי את ה-template:
cp ~/Desktop/creative-people-workshop/.mcp.json.example .mcp.json

# ערכי את .mcp.json והחליפי {{APIFY_TOKEN}} בטוקן האמיתי:
nano .mcp.json   # או VS Code: code .mcp.json
```

תוכן `.mcp.json` אחרי העריכה אמור להיראות כך:

```json
{
  "mcpServers": {
    "apify": {
      "command": "npx",
      "args": ["-y", "@apify/actors-mcp-server"],
      "env": {
        "APIFY_TOKEN": "apify_api_AbCdEf123456..."
      }
    },
    "playwright": {
      "command": "npx",
      "args": ["-y", "@playwright/mcp@latest"]
    }
  }
}
```

### בדיקה

הריצי בתיקיית הפרויקט:

```bash
claude mcp list
```

אמור להחזיר:
```
apify: npx -y @apify/actors-mcp-server - ✓ Connected
playwright: npx -y @playwright/mcp@latest - ✓ Connected
```

אם MCP מסומן **✗ Failed to connect** — בדקי:
- האם הטוקן של Apify נכון?
- האם node+npx מותקנים?
- האם יש חיבור אינטרנט?

---

## שלב 6 · בדיקת Skills

אחרי שהרצת `./install.sh`, ודאי שכל 5 הסקילים זמינים:

```bash
ls ~/.claude/skills/ | grep -E "hebrew|impeccable|skill-creator"
```

אמור להחזיר:
```
hebrew-content-writer
hebrew-document-generator
hebrew-writer
impeccable
skill-creator
```

חמשתם מוכרחים להופיע.

---

## שלב 7 · להביא לקוחה אמיתית

**חובה לסדנה**: לכל משתתפת יהיה PDF של טופס אונבורדינג של לקוחה אמיתית שלה (קיימת או חדשה).

הטופס יכול לכלול:
- שם, תיאור עסקי, נישות
- קהל יעד
- מתחרים שהיא מכירה
- מטרות שיווקיות
- אתר + נכסי סושיאל

אם הטופס שלך באנגלית — בסדר. אם בעברית — מעולה.

בסדנה ננתח אותו, נרחיב אותו, ונייצר דוח אסטרטגיה מלא.

---

## Validation Checklist · לפני הסדנה

מלאי את הצ׳קליסט הזה ושלחי אישור 24h לפני המפגש:

- [ ] `claude --version` מחזיר 2.x
- [ ] `claude login` עבר בהצלחה (חשבון Pro/Max)
- [ ] `git --version`, `node --version` עובדים
- [ ] `yt-dlp --version`, `ffmpeg -version`, `whisper --help` עובדים
- [ ] חשבון Apify פעיל, יש לי טוקן שמור בצד
- [ ] Chrome מותקן (לא Brave, לא Safari)
- [ ] `git clone` של repo הסדנה הצליח
- [ ] `./install.sh` רץ בהצלחה
- [ ] `ls ~/.claude/skills/` מציג את כל 5 הסקילים
- [ ] יצרתי תיקיית פרויקט-לדוגמא עם `.mcp.json` מתוקן
- [ ] `claude mcp list` מציג apify ו-playwright מחוברים
- [ ] יש לי PDF של טופס אונבורדינג של לקוחה אמיתית

---

## תקלות נפוצות

### `claude login` נכשל
- ודאי שיש לך חשבון Pro או Max פעיל
- נסי דפדפן אחר (Chrome מומלץ)
- אם תקועה — נקי cookies של claude.ai

### `claude mcp list` מציג ✗ Failed to connect
- הרצת מתוך תיקיית הפרויקט עם `.mcp.json`? לא מבחוץ
- האם {{APIFY_TOKEN}} הוחלף בטוקן אמיתי?
- בדקי `node --version` (לפחות 18+)

### `pip3 install whisper` נכשל
- נסי `pip install -U openai-whisper` (פייתון 3 ברירת מחדל)
- ב-Mac חדש: `brew install python` קודם

### `git clone` של repo הסדנה — Permission denied
- ודאי שיש לך חיבור אינטרנט
- ה-repo public — לא צריך SSH key

---

## שאלות?

WhatsApp / מייל למנחה. עזרה אישית זמינה עד 24h לפני המפגש.

**נתראה בסדנה!**
