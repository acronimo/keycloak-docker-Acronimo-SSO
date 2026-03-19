# QA Checklist - Acronimo Auth Theme

## Funzionale

- [ ] Login username/password
- [ ] Login username-first + password step
- [ ] Reset password
- [ ] Update password
- [ ] Update profile
- [ ] Error page
- [ ] Info page
- [ ] OTP login
- [ ] Configurazione TOTP
- [ ] Recovery codes input/config
- [ ] WebAuthn register/authenticate/error
- [ ] OAuth consent (se flow abilitato)
- [ ] Logout confirm

## Branding e fallback

- [ ] Nessun override: usa default globali
- [ ] Override realm: applicato a tutti i client del realm
- [ ] Override client: sovrascrive realm
- [ ] Chiavi mancanti: fallback corretto
- [ ] Colore invalido: fallback a default sicuro
- [ ] Logo/Favicon mancanti: fallback locale tema

## i18n

- [ ] EN completa senza chiavi raw
- [ ] IT completa senza chiavi raw
- [ ] Cambio lingua da locale selector

## Accessibilità

- [ ] Navigazione tastiera end-to-end
- [ ] Skip-link funzionante
- [ ] Focus visibile su input/link/button
- [ ] Contrasto testo/sfondo AA con palette default
- [ ] Label input presenti e coerenti

## Responsive

- [ ] Mobile 390x844
- [ ] Tablet 768x1024
- [ ] Desktop 1366x768+
- [ ] Nessun overflow orizzontale

## Sicurezza/UX

- [ ] Errori utente chiari e sintetici
- [ ] Nessuna esposizione stacktrace/info sensibili
- [ ] Nessun JS non necessario oltre script tema e flow Keycloak

## Performance

- [ ] CSS caricato correttamente
- [ ] Asset branding leggeri
- [ ] Tempo di rendering login accettabile in staging
