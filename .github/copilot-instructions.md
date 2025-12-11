## 🎯 Goldene Regel

ALLES bleibt in der `index.html`! Eine einzige Datei. Keine Aufteilung.

## 📦 Projektstruktur

```
passwd.now/
└── index.html    ← Die EINZIGE Datei. Enthält alles.
```

## 🛠️ Tech-Stack (alle via CDN)

| Technologie | Version | CDN |
|-------------|---------|-----|
| Alpine.js | 3.x | `cdn.jsdelivr.net/npm/alpinejs@3.14.3/dist/cdn.min.js` |
| Tailwind CSS | 4.x | `cdn.jsdelivr.net/npm/@tailwindcss/browser@4` |
| DaisyUI | 5.x | `cdn.jsdelivr.net/npm/daisyui@5/daisyui.css` |
| QRCode | 1.5.3 | `cdn.jsdelivr.net/npm/qrcode/+esm` (ES Module Import)

## 🏗️ Architektur

- Single-File HTML mit semantischem Markup, SEO/OG/LD+JSON im `<head>`.
- Styling via Tailwind Browser v4 + DaisyUI Themes/Komponenten.
- Interaktivität via Alpine.js (`x-*` Directives, reaktiver State, Events).
- Kryptographie und Utilities in einem `<script>`-Block unten, keine externe Dateien.

Grundstruktur der `index.html`:

```html
<!DOCTYPE html>
<html lang="de" data-theme="pastel">
    <head>
        <!-- Meta, OG/Twitter, LD+JSON, CDN Links (DaisyUI, Tailwind, HTMX, Alpine, QRCode) -->
    </head>
    <body>
        <div id="app" x-data="passwordGenerator()" x-init="generate()">
            <!-- UI mit DaisyUI, HTMX und Alpine -->
        </div>

        <!-- QRCode via ESM -->
        <script type="module">
            import qrcode from 'https://cdn.jsdelivr.net/npm/qrcode/+esm';
            window.QRCode = qrcode;
        </script>

        <!-- App-Logik (CSPRNG, Entropie, Copy/QR, Theme) -->
        <script>
            // Siehe passwordGenerator() unten
        </script>
    </body>
</html>
```

## ⚠️ Wichtige Regeln

### Keine Dateiseparation
```
❌ styles.css
❌ app.js
❌ components/
❌ package.json
❌ node_modules/

✅ Nur index.html
```

### Alpine.js Best Practices
- State in `x-data` definieren, Methoden als Objekt-Funktionen.
- `x-model` für zwei-Wege-Bindung (Inputs, Checkboxen, Slider).
- Events via `@click`, `@input`, `@change` etc.
- Konditionale Anzeige: `<template x-if="...">` oder `x-show`.
- Klassen dynamisch: `:class="{ 'btn-success': copied }"`.
- `x-init` für Initialisierung beim Mount.
- `x-cloak` im CSS um FOUC zu verhindern.

### Kryptographie
- Immer `crypto.getRandomValues()` für Zufallszahlen.
- Rejection Sampling gegen Modulo-Bias.
- Fisher-Yates Shuffle mit CSPRNG.

### UI/UX
- DaisyUI-Komponenten (cards, buttons, alerts, badges) konsequent nutzen.
- Themes: `data-theme="pastel"` (Light) und `data-theme="dark"` (Dark) per Toggle.
- Deutsche Sprache: Texte, Labels, Fehlermeldungen.
- Mobile-first, responsive Design; sinnvolle Touch-Ziele und Fokuszustände.
- Barrierefreiheit: `aria-label`, `role`, `aria-live` wo sinnvoll.

## 🧪 Testen

Einfach `index.html` im Browser öffnen. Kein Build-Prozess, kein Server nötig.

```bash
# Optional: Lokaler Server
npx serve .
# oder
python -m http.server 8000
```

## 📝 Änderungen vornehmen

1. **Interaktion anpassen:** Alpine-Events/State (`x-*`) direkt im Markup.
2. **Logik ändern:** Funktionen innerhalb von `passwordGenerator()` im unteren `<script>`-Block.
3. **SEO/Meta ändern:** Im `<head>` der HTML-Datei.
4. **CDN-Versionen updaten:** In den Script/Link-Tags.

## 🔒 Sicherheitshinweise

- App läuft 100% lokal (keine Server-Requests nötig für Kernfunktionen).
- Passwörter werden nie übertragen.
- QR-Code wird client-seitig generiert.
- Clipboard: `navigator.clipboard.writeText()` nur auf User-Interaktion.
- Keine sensiblen Daten im URL/History/DOM-Attributen ablegen.

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

- Alpine Docs: https://alpinejs.dev/
- DaisyUI: https://daisyui.com/components/
- Tailwind: https://tailwindcss.com/docs
- Vorsicht bei Template-Strings mit Backticks: `${}` nicht unbeabsichtigt auswerten.

## 🧱 Alpine Muster

- `x-data="passwordGenerator()"` für State.
- `x-model="length"` für zwei-Wege-Bindung.
- `@input="generate()"`, `@click="copy()"`, `@click="makeQR()"`.
- Konditionale Anzeige: `<template x-if="showQR">…</template>`.
- Klassen toggeln via `:class="copied ? 'btn-success' : 'btn-secondary'"`.
- Computed Properties als Getter: `get entropyBits() { return ... }`.
- Async-Methoden für Clipboard/QR: `async copy() { await navigator.clipboard.writeText(...) }`.

---

Hinweis: Dieses Projekt nutzt ausschließlich Alpine.js für Interaktivität (kein HTMX, kein Svelte).
