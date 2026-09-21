#!/usr/bin/env bash
# Plantilla segura: muestra el cambio antes de aplicarlo.
set -euo pipefail
echo "Este script no modifica el sistema automáticamente."
read -r -p "¿Mostrar recomendaciones de hardening? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] || exit 0
cat <<'EOF'
- Revisar servicios innecesarios con systemctl.
- Configurar actualizaciones de seguridad.
- Restringir SSH mediante claves, AllowUsers y sin root remoto.
- Habilitar firewall según la política de la organización.
EOF
