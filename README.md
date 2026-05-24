# Creative People · Client Onboarding Workshop

מערכת אונבורדינג לקוחות סושיאל מבוססת Claude Code · 5 פאזות · 9 סוכני AI · 13 תסריטי צילום בלחיצה.

---

## למי זה?

לסוכנויות מיתוג/סושיאל ישראליות שרוצות אוטומציה של אונבורדינג: טופס אפיון נכנס → דוח אסטרטגיה מלא + ניתוחי וידאו עומק + תסריטי צילום + גאנט תוכן.

---

## מבנה ה-Repo

```
creative-people-workshop/
├── README.md                        # זה הקובץ
├── PRE-WORKSHOP-PREP.md             # מדריך התקנה למשתתפות הסדנה
├── BUILD-SYSTEM.md                  # מפרט הבנייה ל-Plan Mode (109K)
├── install.sh                       # מעתיק 5 סקילים ל-~/.claude/skills/
├── .gitignore
├── skills/                          # 5 סקילים מבונדלים
│   ├── hebrew-content-writer/
│   ├── hebrew-writer/
│   ├── hebrew-document-generator/
│   ├── impeccable/
│   └── skill-creator/
├── templates/                       # 2 תבניות HTML
│   ├── report-template.html              # client-brand (ברירת מחדל)
│   ├── report-template-cp-house.html     # Jeremy 1:1 (מונוכרום)
│   └── reference-presentation-jeremy.pdf
├── workshop-slides.pdf              # שקפי הסדנה
└── CHEAT-SHEET-A4.pdf              # דף עזר A4 landscape
```

**הערה**: ה-MCPs (Apify + Playwright) **לא** מוגדרים מראש. Claude יוצרת את `.mcp.json` אוטומטית במהלך בנייה (BUILD-SYSTEM.md מנחה אותה לבקש את הטוקן ולכתוב את הקובץ).

---

## Quick Start

### לפני הסדנה (פעם אחת)

```bash
# 1. Clone
git clone https://github.com/shonho159-source/creative-people-workshop.git
cd creative-people-workshop

# 2. התקיני סקילים
./install.sh

# 3. עברי על PRE-WORKSHOP-PREP.md למלא את שאר הצ׳קליסט
open PRE-WORKSHOP-PREP.md
```

### בסדנה — בנייה מ-0

הכל ידני ב-Finder, ופרומפט אחד ב-Claude Code:

```
1. ב-Finder: צרי תיקייה בשם my-agency על Desktop
2. ב-Finder: גררי את BUILD-SYSTEM.md מ-repo הסדנה לתוכה
3. בתיקייה: Right-click → New Terminal at Folder, ואז כתבי: claude
4. Shift+Tab (Plan Mode) ותדביקי:
```

> קראי את BUILD-SYSTEM.md ובני את כל המערכת בתיקייה הזאת לפי המפרט.

Claude תכננן את הבנייה, את תאשרי, היא תיצור 13 קבצים + תוריד 2 templates, ובסוף תבקש את הטוקן Apify ותכתוב .mcp.json. סגרי ופתחי את Claude Code מחדש (`/exit` ואז `claude`) — המערכת מוכנה.

אחרי בנייה, הוסיפי לקוחה:

```
5. ב-Finder: צרי תיקייה בשם הלקוחה תחת clients/, ותוכה תיקייה 00-intake/
6. גררי את ה-PDF של הלקוחה לתוך 00-intake/
7. ב-Claude Code, הדביקי פרומפט אונבורדינג (ראי PRE-WORKSHOP-PREP.md)
```

המתנה 15-25 דקות. תוצרים ב-`clients/<slug>/04-deliverables/`.

---

## מה המערכת מפיקה?

| תוצר | קובץ | פאזה |
|---|---|---|
| מסמך לקוחה מועשר | CLIENT.md | 1 |
| ניתוח הסושיאל של הלקוחה (3 פלטפורמות) | 02-analysis/client-content.md | 2 |
| 5 מתחרים ישראלים + תוכן מוביל | 02-analysis/local-competitors.md | 2 |
| 5 מתחרים גלובליים | 02-analysis/global-competitors.md | 2 |
| 5 טרנדים + 5 סאונדים | 02-analysis/trends.md | 2 |
| 9 ניתוחי וידאו עומק (תמלול+ויזואל) | 02b-video-deep/ | 2.5 |
| זהות ויזואלית (צבעים, פונטים) | 03-brand/visual.md | 3 |
| פרופיל טון ו-Anti-tone | 03-brand/voice.md | 3 |
| **דוח אסטרטגיה HTML + PDF** | 04-deliverables/report.html · .pdf | 4 |

ואחר כך, on-demand:

- `/write-shooting-scripts <slug>` → 11-13 תסריטי צילום
- `/generate-content-gantt <slug>` → גאנט תוכן 4 שבועות
- בקשה חופשית ל-Claude → קופי ל-Landing, פיץ' דק, רעיון יצירתי וכו׳

---

## 2 סגנונות דוח

| מצב | פקודה | מאפיינים |
|---|---|---|
| **client-brand** (ברירת מחדל) | `/onboard-client <slug>` | פלטה של צבעי הלקוחה כאקסנט, Editorial Magazine |
| **cp-house** (Jeremy 1:1) | `/onboard-client <slug> --style=cp-house` | מונוכרום, Cormorant Garamond, pill section headers |

---

## עקרונות בלתי-מתפשרים (מובנים במערכת)

- עברית תקנית בלבד · ללא em-dashes · ללא מילים אסורות (חיוני/מהותי/ייחודי...)
- 5 מתחרים מינימום בכל קטגוריה · 3 פלטפורמות חובה (IG + TikTok + FB)
- לינקים לפוסטים בלבד (לא לפרופילים)
- 9 ניתוחי וידאו חובה (yt-dlp + cookies fallback + Apify fallback)
- גיוון פרסונות בתסריטים — לא יותר מ-40% מאותה פרסונה
- נישות גמישות — 1, 2 או יותר (הפרדה רק אם 2+)
- דאטה אמיתי בלבד — אם Apify ריק → "לא נמצא"

הכל מוטמע ב-CLAUDE.md וב-Self-Check של כל סוכן.

---

## תקציב

- Apify: $5-15 לריצת `/onboard-client`
- Claude Code: כלול ב-Pro/Max ($20/חודש)

---

## רישיון

לשימוש פנימי של Creative People agency + סוכנויות שותפות. שאלות: פני לשון (shon@shondigital.com).
