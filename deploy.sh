#!/usr/bin/env bash
set -euo pipefail
ssh schizo 'cd /var/www/songo && git pull --ff-only && docker compose up -d --build && docker image prune -f'
