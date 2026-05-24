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
| **5 Skills של עברית ועיצוב** | מתוך ה-repo של הסדנה | ליטוש עברית + יצירת PDF + design system |
| **Repo הסדנה** | clone מ-GitHub | מביא את כל הקבצים שתצטרכי |

**שימי לב**: ה-MCPs (Apify + Playwright) מותקנים אוטומטית בסדנה דרך Claude — את לא צריכה לעשות איתם כלום מראש, **חוץ מלהכין את הטוקן של Apify**.

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

## שלב 3 · חשבון Apify + Token (קריטי!)

בסדנה Claude תבקש ממך את הטוקן. **חייב להיות לך מוכן ושמור** — אחרת תיתקעי 5-10 דקות לקבל אותו.

### יצירת החשבון

1. הירשמי ב-https://apify.com/sign-up (חינמי, יש credit מתנה של $5 בערך)
2. אישור מייל

### לקיחת הטוקן — שלב אחר שלב

ה-**Apify Console** הוא הדף שאליו את צריכה להגיע: **https://console.apify.com**

#### Path 1 — Settings

```
console.apify.com
    ↓
  לחיצה על האווטר/השם שלך (פינה ימנית עליונה)
    ↓
  Settings (תפריט שנפתח)
    ↓
  בתפריט הצדדי השמאלי: Integrations
    ↓
  לשונית "API tokens"
    ↓
  לחיצה על "+ Create new token"
    ↓
  שם לטוקן: "workshop" (או כל שם)
    ↓
  Permissions: השאירי על Full access (ברירת מחדל)
    ↓
  Create
    ↓
  לחיצה על אייקון ההעתקה 📋 ליד הטוקן
    ↓
  הדביקי במקום בטוח — לדוגמה הערה ב-Notes app
```

### מה הטוקן צריך להיראות

```
apify_api_AbCdEf1234567890GhIjKlMnOpQrSt
```

מתחיל ב-`apify_api_` ואחריו ~40 תווים אלפאנומריים.

### לפני הסדנה — בדיקה

1. פתחי Notes app (או כל מקום ששמרת בו את הטוקן)
2. ודאי שהטוקן עדיין שם
3. תהיי מסוגלת לפתוח אותו תוך 5 שניות בזמן הסדנה

> **תקציב**: ריצה אחת של אונבורדינג עולה $5-15 ב-Apify. ה-credit ההתחלתי החינמי אמור להספיק.

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

### בדיקה

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

## שלב 5 · הכנת לקוחה אמיתית

**חובה לסדנה**: PDF של טופס אונבורדינג של לקוחה אמיתית שלך.

הטופס יכול לכלול:
- שם, תיאור עסקי, נישות
- קהל יעד
- מתחרים שהיא מכירה
- מטרות שיווקיות
- אתר + נכסי סושיאל

אם הטופס שלך באנגלית — בסדר. אם בעברית — מעולה.

**שמרי אותו ב-`~/Downloads/`** (או כל מקום שתזכרי) עם שם פשוט כמו `client-intake.pdf`.

---

## Validation Checklist · לפני הסדנה

מלאי את הצ׳קליסט הזה ושלחי אישור 24h לפני המפגש:

- [ ] `claude --version` מחזיר 2.x
- [ ] `claude login` עבר בהצלחה (חשבון Pro/Max)
- [ ] `git --version`, `node --version` עובדים
- [ ] `yt-dlp --version`, `ffmpeg -version`, `whisper --help` עובדים
- [ ] Chrome מותקן (לא Brave, לא Safari)
- [ ] חשבון Apify פעיל
- [ ] **טוקן Apify שמור אצלי ב-Notes** (אני יכולה להגיע אליו תוך 5 שניות)
- [ ] `git clone` של repo הסדנה הצליח
- [ ] `./install.sh` רץ בהצלחה
- [ ] `ls ~/.claude/skills/` מציג את כל 5 הסקילים
- [ ] יש לי PDF של טופס אונבורדינג של לקוחה אמיתית ב-`~/Downloads/`

---

## תקלות נפוצות

### `claude login` נכשל
- ודאי שיש לך חשבון Pro או Max פעיל
- נסי דפדפן אחר (Chrome מומלץ)
- אם תקועה — נקי cookies של claude.ai

### לא מוצאת את כפתור "Create new token" ב-Apify
- ודאי שאת ב-https://console.apify.com (לא apify.com/home)
- ודאי שאת ב-`Settings → Integrations → API tokens`
- אם רואה רק token אחד קיים — אפשר להשתמש בו (לחיצה על העין 👁 לחשיפה, אחר כך 📋 להעתקה)

### `pip3 install whisper` נכשל
- נסי `pip install -U openai-whisper` (פייתון 3 ברירת מחדל)
- ב-Mac חדש: `brew install python` קודם

### `git clone` של repo הסדנה — Permission denied
- ודאי שיש לך חיבור אינטרנט
- ה-repo public — לא צריך SSH key

### "New Terminal at Folder" לא מופיע בלחיצה ימנית
- System Settings → Keyboard → Keyboard Shortcuts → Services → "Files and Folders" → tick "New Terminal at Folder"
- חלופה: פתחי Terminal רגיל ועשי `cd ~/Desktop/my-agency` ידנית

---

## שאלות?

WhatsApp / מייל למנחה. עזרה אישית זמינה עד 24h לפני המפגש.

**נתראה בסדנה!**
