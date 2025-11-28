# CLAUDE.md – Projektanweisungen für passwd.now

## 🎯 Goldene Regel

**ALLES bleibt in der `index.html`!** Eine einzige Datei. Keine Aufteilung. Niemals.

## 📦 Projektstruktur

```
passwd.now/
└── index.html    ← Die EINZIGE Datei. Enthält alles.
```

## 🛠️ Tech-Stack (alle via CDN)

| Technologie | Version | CDN |
|-------------|---------|-----|
| Svelte | 4.x | `esm.sh/svelte@4` (Browser-Kompilierung) |
| Tailwind CSS | 4.x | `cdn.jsdelivr.net/npm/@tailwindcss/browser@4` |
| DaisyUI | 5.x | `cdn.jsdelivr.net/npm/daisyui@5` |
| QRCode | 1.5.3 | `esm.sh/qrcode@1.5.3` (ES Module Import) |

## 🏗️ Architektur

Die `index.html` hat diese Struktur:

```html
<!DOCTYPE html>
<html lang="de" data-theme="pastel">
<head>
    <!-- SEO Meta Tags -->
    <!-- Open Graph / Twitter -->
    <!-- Structured Data (JSON-LD) -->
    <!-- CDN Imports (DaisyUI CSS, Tailwind Browser) -->
</head>
<body>
    <div id="app"></div>
    
    <script type="module">
        // 1. Imports (Svelte-Compiler + externe Libraries)
        import { compile } from 'https://esm.sh/svelte@4/compiler';
        import QRCode from 'https://esm.sh/qrcode@1.5.3';
        
        // 2. Libraries global verfügbar machen für Svelte
        window.QRCode = QRCode;
        
        // 3. Svelte-Code als Template-String
        const svelteCode = `
            <script>
                // Svelte-Logik hier
            <\/script>
            
            <!-- Svelte-Template hier -->
        `;
        
        // 4. Browser-Kompilierung & Mount
        async function initApp() { ... }
        initApp();
    </script>
</body>
</html>
```

## ⚠️ Wichtige Regeln

### Svelte-Escaping
Das schließende Script-Tag im Svelte-Code MUSS escaped werden:
```javascript
// ❌ FALSCH - bricht das HTML
</script>

// ✅ RICHTIG - escaped
<\/script>
```

### Keine Dateiseparation
```
❌ styles.css
❌ app.js
❌ components/
❌ package.json
❌ node_modules/

✅ Nur index.html
```

### Kryptographie
- Immer `crypto.getRandomValues()` für Zufallszahlen
- Rejection Sampling gegen Modulo-Bias
- Fisher-Yates Shuffle mit CSPRNG

### UI/UX
- DaisyUI-Komponenten nutzen (cards, buttons, alerts, etc.)
- `data-theme="pastel"` für Light, `data-theme="dark"` für Dark
- Deutsche Sprache (Texte, Labels, Fehlermeldungen)
- Mobile-first, responsive Design

## 🧪 Testen

Einfach `index.html` im Browser öffnen. Kein Build-Prozess, kein Server nötig.

```bash
# Optional: Lokaler Server
npx serve .
# oder
python -m http.server 8000
```

## 📝 Änderungen vornehmen

1. **Svelte-Logik ändern:** Im `const svelteCode = \`...\`` Template-String
2. **HTML/Template ändern:** Ebenfalls im Template-String
3. **SEO/Meta ändern:** Im `<head>` der äußeren HTML
4. **CDN-Versionen updaten:** In den Script/Link-Tags

## 🔒 Sicherheitshinweise

- App läuft 100% lokal (keine Server-Requests)
- Passwörter werden nie übertragen
- QR-Code wird client-seitig generiert

## 🎨 Design-System

```
Farben (DaisyUI):
- primary: Hauptaktionen
- secondary: Sekundäre Buttons
- accent: QR-Code Button
- base-100/200/300: Hintergründe
- success: Kopiert-Feedback
- error: Fehlermeldungen

Rundungen:
- rounded-2xl: Cards, Buttons
- rounded-xl: Inputs
- rounded-lg: Checkboxen
- rounded-full: Progress-Bars
```

## 💡 Tipps

- Bei Svelte-Fehlern: Browser-Konsole prüfen
- Template-Strings mit Backticks: Vorsicht bei `${}`
- DaisyUI Docs: https://daisyui.com/components/
- Tailwind Docs: https://tailwindcss.com/docs

