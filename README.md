# songo

A static [Deck.cc](https://deck.cc) site for **Songo** — "Píseň pro ty, které milujete"
(a personalised-song service). Landing page + order wizard, no backend or database.

## Structure

- `Songo.dc.html` — landing page (site entry point / index)
- `Objednavka.dc.html` — order wizard
- `support.js` — Deck.cc runtime (generated; do not edit by hand)
- `screenshots/`, `uploads/` — reference images / embedded assets

## Run locally

```bash
python3 -m http.server 8000
# open http://localhost:8000/Songo.dc.html
```

## Hosting

Deployed on the schizo server as a small nginx container behind Nginx Proxy Manager,
attached to the shared external `npm_proxy` Docker network (same pattern as timo.now).

- Lives at `/var/www/songo` on the server
- `docker compose up -d --build` → container `songo_web` serving on port 80 (network-only)
- NPM proxies the public domain → `songo_web:80`

### Redeploy

Commit + push to `main`, then:

```bash
./deploy.sh
```

which SSHes into `schizo`, pulls, and rebuilds the container.
