# 🔐 passwd.now

> **Kostenloser Passwort Generator** – Generate password sicher und offline mit kryptographisch sicherer Zufallsgenerierung

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/yourusername/passwd.now)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/docker-ready-blue.svg)](Dockerfile)
[![Security](https://img.shields.io/badge/security-100%25%20offline-success.svg)](index.html)

Ein moderner, sicherer Passwort-Generator als Single-File-Webanwendung. Läuft komplett offline im Browser – keine Datenübertragung, keine Server-Requests, maximale Privatsphäre.

---

## ✨ Features

- 🔒 **Kryptographisch sicher** – Nutzt `crypto.getRandomValues()` für echte Zufälligkeit
- 📏 **Anpassbare Länge** – Von 4 bis 256 Zeichen frei wählbar
- 🎛️ **Flexible Zeichentypen** – Groß-/Kleinbuchstaben, Zahlen, Sonderzeichen
- 📊 **Entropie-Anzeige** – Echtzeit-Feedback zur Passwort-Sicherheit
- 📱 **QR-Code Export** – Sichere Offline-Übertragung auf andere Geräte
- 🌓 **Dark/Light Theme** – Automatischer Theme-Wechsel
- 📱 **Responsive Design** – Funktioniert perfekt auf Desktop, Tablet & Smartphone
- 🚀 **100% Offline** – Keine Datenübertragung, keine Tracking, keine Cookies
- ⚡ **Zero Dependencies** – Alles via CDN, keine Installation nötig
- 🎨 **Modern UI** – DaisyUI + Tailwind CSS für ein schönes Design

---

## 🛠️ Technologie-Stack

| Technologie | Version | Verwendung |
|-------------|---------|------------|
| **Svelte** | 4.x | Frontend-Framework (Browser-Kompilierung) |
| **Tailwind CSS** | 4.x | Utility-First CSS Framework |
| **DaisyUI** | 5.x | Komponenten-Bibliothek |
| **QRCode** | 1.5.3 | QR-Code Generierung |
| **Nginx** | Alpine | Production-Webserver (Docker) |

**Architektur:**
- ✅ Single-File-Architektur (`index.html` enthält alles)
- ✅ Alle Dependencies via CDN (kein npm/node_modules)
- ✅ Browser-basierte Svelte-Kompilierung
- ✅ Zero Build-Prozess

---

## 🚀 Installation & Verwendung

### Option 1: Direkt im Browser (Lokal)

1. **Datei öffnen:**
   ```bash
   # Einfach index.html im Browser öffnen
   open index.html
   # oder
   start index.html  # Windows
   ```

2. **Fertig!** Die App läuft komplett lokal, keine Installation nötig.

### Option 2: Lokaler Webserver (Optional)

```bash
# Python
python -m http.server 8000

# Node.js
npx serve .

# PHP
php -S localhost:8000
```

Dann öffne: `http://localhost:8000`

### Option 3: Docker (Production)

#### Mit Docker Compose (Empfohlen)

```bash
# Container starten
docker-compose up -d

# Oder mit Build
docker-compose up --build -d

# Container stoppen
docker-compose down
```

Die App läuft dann auf: `http://localhost`

#### Manuell mit Docker

```bash
# Image bauen
docker build -t passwd-now .

# Container starten
docker run -d -p 80:80 --name passwd-now passwd-now

# Container stoppen
docker stop passwd-now
docker rm passwd-now
```

---

## 🔒 Sicherheit

### Kryptographische Methoden

1. **`crypto.getRandomValues()`**
   - Nutzt die kryptographisch sichere Zufallsquelle des Betriebssystems
   - Keine pseudo-zufälligen Generatoren

2. **Rejection Sampling**
   - Eliminiert Modulo-Bias bei der Zeichenauswahl
   - Garantiert gleichmäßige Verteilung

3. **Fisher-Yates Shuffle**
   - Kryptographisch sicherer Shuffle-Algorithmus
   - Verwendet CSPRNG (Cryptographically Secure Pseudorandom Number Generator)

### Datenschutz

- ✅ **100% lokal** – Alle Berechnungen im Browser
- ✅ **Keine Datenübertragung** – Keine Server-Requests
- ✅ **Keine Cookies** – Keine Tracking-Mechanismen
- ✅ **Keine Logs** – Keine Speicherung von Passwörtern
- ✅ **Open Source** – Vollständig einsehbarer Code

### Entropie-Berechnung

Die Entropie wird in Bits angezeigt und basiert auf:
```
Entropie = Länge × log₂(Zeichenpool-Größe)
```

**Richtwerte:**
- 🟢 **128+ Bits** = Exzellent (unknackbar)
- 🔵 **80+ Bits** = Stark
- 🟣 **60+ Bits** = Gut
- 🟡 **40+ Bits** = Moderat
- 🔴 **<40 Bits** = Schwach

---

## 📁 Projektstruktur

```
passwd.now/
├── index.html              # Die EINZIGE Datei - enthält alles
├── Dockerfile              # Multi-Stage Docker Build
├── docker-compose.yml      # Docker Compose Konfiguration
├── nginx.conf              # Nginx Performance-Konfiguration
├── .dockerignore           # Docker Ignore Rules
├── package.json            # Projekt-Metadaten
├── OPTIMIZATIONS.md        # Performance-Dokumentation
└── README.md               # Diese Datei
```

**Wichtig:** Das Projekt folgt der **Single-File-Architektur**. Alles ist in `index.html` enthalten – keine separaten CSS/JS-Dateien, keine Build-Pipeline.

---

## ⚡ Performance-Optimierungen

### Docker Build

- ✅ **HTML-Minification** – Automatische Komprimierung während Build
- ✅ **Multi-Stage Build** – Minimale Image-Größe (~5MB Base)
- ✅ **Alpine Linux** – Leichtgewichtiges Base-Image

### Nginx-Konfiguration

- ✅ **Gzip-Kompression** – Level 6 für optimale Balance
- ✅ **Worker-Prozesse** – Automatische CPU-Kern-Nutzung
- ✅ **Sendfile** – Kernel-Bypass für direkte Dateiübertragung
- ✅ **Keep-Alive** – 65s Timeout, 100 Requests
- ✅ **Security Headers** – XSS-Protection, Content-Type-Options, etc.

### Erwartete Performance

- 📦 **Dateigröße:** ~30-50% Reduktion durch Minification
- 🚀 **Transfer-Zeit:** ~70-80% Reduktion durch Gzip
- 🔄 **Concurrent Requests:** Bis zu 4096 gleichzeitige Connections
- 💾 **Memory:** Minimaler Footprint (~5MB Base + Nginx)
- ⚡ **First Byte Time:** <10ms (dank sendfile)

Siehe [OPTIMIZATIONS.md](OPTIMIZATIONS.md) für Details.

---

## 🧪 Development

### Lokale Entwicklung

1. Öffne `index.html` im Browser
2. Bearbeite den Svelte-Code im Template-String (Zeile ~162)
3. Lade die Seite neu – Änderungen sind sofort sichtbar

### Wichtige Hinweise

- **Svelte-Escaping:** Das schließende `</script>` Tag im Svelte-Code muss escaped werden: `<\/script>`
- **Keine Dateiseparation:** Alles bleibt in `index.html`
- **CDN-Versionen:** Aktualisiere die CDN-URLs im `<head>` bei Bedarf

### Testing

```bash
# Einfach im Browser öffnen - kein Build nötig!
open index.html

# Oder mit lokalem Server
python -m http.server 8000
```

---

## 📦 Deployment

### Docker Hub / Container Registry

```bash
# Image taggen
docker tag passwd-now yourusername/passwd-now:latest

# Push zu Docker Hub
docker push yourusername/passwd-now:latest
```

### Production-Server

```bash
# Auf Server deployen
docker-compose up -d

# Health Check testen
curl http://localhost/health

# Logs ansehen
docker-compose logs -f nginx
```

### Nginx Reverse Proxy (Optional)

```nginx
server {
    listen 443 ssl http2;
    server_name passwd.example.com;
    
    location / {
        proxy_pass http://localhost:80;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

---

## 📊 Health Check

Der Container bietet einen Health Check Endpoint:

```bash
# Health Status prüfen
curl http://localhost/health

# Erwartete Antwort: HTTP 200 OK
```

---

## ❓ FAQ

### Wie sicher ist dieser Generator?

Sehr sicher! Wir nutzen `crypto.getRandomValues()` – die kryptographisch sichere Zufallsquelle deines Betriebssystems. Zusätzlich verwenden wir Rejection Sampling um Modulo-Bias zu eliminieren.

### Werden Passwörter gespeichert oder übertragen?

**Nein!** Alles läuft 100% lokal im Browser. Keine Datenübertragung, keine Speicherung, keine Logs.

### Wie lang sollte mein Passwort sein?

- **12-16 Zeichen** für normale Accounts
- **20+ Zeichen** für wichtige Accounts (E-Mail, Banking)
- **32+ Zeichen** für Master-Passwörter
- **64+ Zeichen** mit Passwort-Manager (empfohlen)

### Was bedeutet Entropie?

Entropie misst die Unvorhersagbarkeit eines Passworts in Bits. Je höher, desto sicherer. 128+ Bits gelten als unknackbar.

### Wozu dient der QR-Code?

Der QR-Code ermöglicht sichere Offline-Übertragung auf andere Geräte. Statt das Passwort über unsichere Kanäle zu kopieren, scannst du einfach den QR-Code.

### Kann ich die App offline nutzen?

Ja! Einmal geladen, funktioniert die App komplett offline. Alle Dependencies werden via CDN geladen, aber nach dem ersten Laden funktioniert alles auch ohne Internet.

---

## 🔗 Links & Ressourcen

- **Svelte:** https://svelte.dev
- **Tailwind CSS:** https://tailwindcss.com
- **DaisyUI:** https://daisyui.com
- **QRCode Library:** https://github.com/soldair/node-qrcode

### Empfohlene Passwort-Manager

- [1Password](https://1password.com) – Premium, benutzerfreundlich
- [Bitwarden](https://bitwarden.com) – Open Source, kostenlos
- [NordPass](https://nordpass.com) – Modern, sicher
- [LastPass](https://lastpass.com) – Etabliert, weit verbreitet

---

## 📝 Lizenz

[MIT License](LICENSE) – Siehe LICENSE-Datei für Details.

---

## 🤝 Contributing

Contributions sind willkommen! Bitte beachte:

- Das Projekt folgt der Single-File-Architektur
- Alles bleibt in `index.html`
- Keine separaten Dateien oder Build-Prozesse

---

## ⭐ Credits

Entwickelt mit ❤️ für maximale Sicherheit und Privatsphäre.

**Made with:**
- Svelte 4
- Tailwind CSS 4
- DaisyUI 5
- QRCode.js

---

## 📧 Support

Bei Fragen oder Problemen öffne bitte ein [Issue](https://github.com/yourusername/passwd.now/issues).

---

**🔐 Bleib sicher! Nutze starke, einzigartige Passwörter für jeden Account.**

