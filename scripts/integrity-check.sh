#!/usr/bin/env bash
# Genera hashes SHA-256 de rutas proporcionadas; no cambia archivos.
set -euo pipefail
if (($# == 0)); then echo "Uso: $0 RUTA [RUTA...]"; exit 1; fi
for path in "$@"; do
  [[ -e "$path" ]] || { echo "No existe: $path" >&2; continue; }
  if [[ -f "$path" ]]; then sha256sum "$path"; else find "$path" -type f -print0 | sort -z | xargs -0 sha256sum; fi
done
