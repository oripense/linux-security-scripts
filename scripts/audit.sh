#!/usr/bin/env bash
# Auditoría no intrusiva de información básica del host.
set -euo pipefail
echo "== Aegis quick audit =="
echo "Hostname: $(hostname)"; echo "Kernel: $(uname -r)"
echo "\nServicios activos:"; systemctl list-units --type=service --state=running --no-pager 2>/dev/null | head -n 12 || true
echo "\nPuertos en escucha:"; ss -tuln 2>/dev/null || true
