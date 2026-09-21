# Aegis Security Operations

Una interfaz web estática para presentar operaciones de ciberseguridad junto a utilidades Bash auditables. El dashboard no se conecta a infraestructura real: sus datos, alertas y terminal son una simulación segura para demostración.

## Inicio rápido

```bash
python3 -m http.server 8080
```

Abre `http://localhost:8080`. No requiere Node.js, compilación ni dependencias de terceros.

## Dashboard

- Radar animado y métricas de postura de seguridad.
- Gráfico Canvas adaptable con selector de periodo.
- Terminal simulada; acepta `help`, `status`, `scan --quick`, `alerts` y `clear`.
- Alertas priorizadas y enlaces a herramientas operativas.

## Scripts Bash

Los scripts están en [`scripts/`](scripts/) y mantienen una filosofía de mínimo privilegio:

| Script | Propósito | Efecto |
| --- | --- | --- |
| `audit.sh` | Inventario básico de host, servicios y puertos. | Solo lectura. |
| `hardening.sh` | Lista controles de endurecimiento tras confirmación. | No modifica el host. |
| `integrity-check.sh` | Calcula hashes SHA-256 de archivos o directorios. | Solo lectura. |

Ejecuta los scripts explícitamente y revisa su contenido antes de usarlo en producción:

```bash
bash scripts/audit.sh
bash scripts/hardening.sh
bash scripts/integrity-check.sh /etc/ssh
```

## Estructura

```text
assets/css/style.css       Diseño, responsividad y animaciones
assets/js/dashboard.js     Interacciones de dashboard y terminal simulada
scripts/                   Utilidades Bash independientes
index.html                 Aplicación web estática
```

## Seguridad y alcance

Este proyecto es una base de experiencia visual, no un SIEM ni un sustituto de una política de seguridad. No pegues credenciales ni datos sensibles en la terminal simulada. Para producción, conecta una API autenticada, registra auditoría, aplica RBAC y valida los comandos del lado del servidor.
