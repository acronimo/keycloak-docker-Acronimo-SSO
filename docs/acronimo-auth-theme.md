# Acronimo Auth Theme

Tema login enterprise multi-tenant/prodotto per Keycloak, senza hardcode cliente.

## 1) Struttura tema

- Tema nuovo: `theme/acronimo-auth/login`
- Tema legacy mantenuto: `theme/keywind/login`
- Build Docker aggiornata per copiare **tutti** i temi (`COPY /theme /opt/keycloak/themes`)

## 2) Branding globale (default)

Definito in `theme/acronimo-auth/login/theme.properties`:

- `brandDefaultProductName`
- `brandDefaultCopyBrief`
- `brandDefaultLogo`
- `brandDefaultFavicon`
- `brandDefaultPrimaryColor`
- `brandDefaultPrimaryHoverColor`
- `brandDefaultTextColor`
- `brandDefaultTextMutedColor`
- `brandDefaultBackgroundColor`
- `brandDefaultSurfaceColor`
- `brandDefaultBorderColor`
- `brandDefaultFocusColor`
- `brandDefaultRadius`
- `brandDefaultMode` (`auto|light|dark`)

## 3) Override tenant/prodotto

Resolver centralizzato: `components/config/branding.ftl`.

Priorità fallback (dal più specifico):

1. `client.attributes[...]` (override prodotto)
2. `realm.attributes[...]` (override tenant)
3. `theme.properties` default globali
4. default di sicurezza hardcoded nel resolver

Chiavi supportate su realm/client attributes:

- `brand.productName`, `brand.name`, `product.name`
- `brand.copyBrief`, `product.copyBrief`
- `brand.logo`, `product.logo`
- `brand.favicon`, `product.favicon`
- `brand.color.primary`, `product.color.primary`
- `brand.color.primaryHover`, `product.color.primaryHover`
- `brand.color.text`
- `brand.color.textMuted`
- `brand.color.background`
- `brand.color.surface`
- `brand.color.border`
- `brand.color.focus`
- `brand.radius` (es. `12px`, `0.75rem`)
- `brand.mode`, `product.mode` (`auto|light|dark`)

Note:

- `brand.logo`/`brand.favicon`: possono essere URL assoluti `https://...` o path risorsa tema (es. `brand/my-logo.svg`).
- Colori e radius vengono validati con whitelist regex; se invalidi, fallback automatico.

## 4) Fallback behavior

Se un override manca o è invalido:

- si passa al livello successivo (client -> realm -> theme.properties -> default)
- il tema resta renderizzabile senza errori
- logo/favicon hanno fallback a `resources/brand/acronimo-logo.svg` e `resources/brand/favicon.svg`

## 5) Internationalization (IT/EN)

Bundle tema:

- `theme/acronimo-auth/login/messages/messages_en.properties`
- `theme/acronimo-auth/login/messages/messages_it.properties`

Per aggiungere una lingua (es. FR):

1. creare `messages_fr.properties`
2. aggiungere codice lingua in `theme.properties` (`locales=en,it,fr`)
3. tradurre tutte le chiavi custom del tema
4. testare selector lingua e fallback

## 6) Accessibilità e UX

Implementato nel tema:

- skip-link tastiera (`acronimoSkipToContent`)
- focus ring evidente
- contrasti orientati AA (testare palette custom override)
- semantica (`main`, `header`, `footer`, `nav`, `aria-label`)
- messaggi errore sintetici lato UI (nessun leak dati sensibili)

## 7) Responsive e dark/light

- layout mobile-first, card centrata con larghezza fluida
- dark mode:
  - forzata con `brand.mode=dark`
  - forzata light con `brand.mode=light`
  - automatica con `brand.mode=auto` (prefers-color-scheme)

## 8) Pagine auth coperte

Il tema include i template login completi, tra cui:

- `login.ftl`, `login-username.ftl`, `login-password.ftl`
- reset/update password
- update profile
- OTP/TOTP + recovery codes
- webauthn authenticate/register/error
- consent (`login-oauth-grant.ftl`)
- error (`error.ftl`) e info (`info.ftl`)
- terms, logout confirm, select authenticator, page expired

## 9) Preview locale

### Build image

```bash
docker build -t acronimo-keycloak .
```

### Run

```bash
docker run --rm -p 8080:8080 --env-file .env.keycloak.example acronimo-keycloak
```

### Attiva tema nel realm

In Keycloak Admin Console:

- Realm Settings -> Themes -> Login Theme = `acronimo-auth`

### Guida screenshot locale

- Aprire login page del realm
- Catturare desktop (>=1366px), tablet (~768px), mobile (~390px)
- Verificare varianti light/dark e IT/EN

## 10) Rollout staging/prod

1. Deploy immagine con tema incluso.
2. In staging, attivare `acronimo-auth` su un realm pilota.
3. Validare login base, reset password, OTP/TOTP, webauthn, consent, logout.
4. Validare override branding per almeno:
   - un realm senza override
   - un realm con override tenant
   - un client con override prodotto
5. Eseguire smoke test cross-browser (Chrome/Edge/Safari/Firefox).
6. Promuovere in produzione con change window e rollback plan:
   - rollback rapido: ripristinare login theme precedente (`keywind` o altro) dal pannello admin.
