# Nexlayer — dungeon-revealer

<!-- nexlayer:meta version=1 analyzed=2026-06-10T17:23:09Z repo=https://github.com/KatieHarris2397/dungeon-revealer branch=master -->

> **For AI agents (Claude Code, Cursor, Gemini CLI, Copilot):**
> This file is the **project context** for this Nexlayer deployment — tech stack, env vars, secrets, live URL.
> For full platform detail (nexlayer.yaml schema, Dockerfile rules, CI/CD, task recipes) read **`nexlayer.skills`** in this repo.
>
> **Critical rules (full detail in `nexlayer.skills`):**
> - Inter-pod refs: `${podName:port}` only — never `localhost` or bare hostnames
> - Docker Hub images: prefix with `mirror.gcr.io/library/` — bare tags fail on the cluster
> - Secrets: set in the Nexlayer dashboard — never commit to `nexlayer.yaml` or Dockerfile
>
> **This file:** `agent-managed` sections update automatically. `user-editable` sections (Local Development Setup, Nexlayer Deployment Plan, Build Notes) are yours — preserved across re-analysis.

## Project Summary
<!-- nexlayer:section agent-managed=project_summary -->
Dungeon Revealer is an open-source self-hosted virtual tabletop application designed for pen-and-paper RPGs, featuring map revealing, token movement, and dice roll chat.
<!-- nexlayer:end -->

## Technology Stack
<!-- nexlayer:section agent-managed=tech_stack -->
| Name | Kind | Version | Detected From |
|------|------|---------|---------------|
| Node.js | language | 16 | Dockerfile |
| TypeScript | language | Not specified | tsconfig.json, package.json |
| Vite | build | Not specified | vite.config.ts, package.json |
| Relay | framework | Not specified | relay.config.js, package.json |
| GraphQL | framework | Not specified | type-definitions.graphql, package.json |
| Caxa | tool | Not specified | package.json |
<!-- nexlayer:end -->

## Repository Structure
<!-- nexlayer:section agent-managed=structure_map -->
- server/ — TypeScript backend implementation and API
- src/ — Frontend source code using Relay and Vite
- public/ — Static assets
- scripts/ — Build and schema generation utility scripts
- bin/ — Compiled binary distributions
<!-- nexlayer:end -->

## External Services Required
<!-- nexlayer:section agent-managed=external_deps -->
_No external services detected._
<!-- nexlayer:end -->

## Local Development Setup
<!-- nexlayer:section user-editable=local_setup -->
### Prerequisites

- Node.js >= 16
- npm

### Environment variables

Copy `.env.example` to `.env.local` and fill in:

```
NODE_ENV=development
```

### Steps

1. `npm install` — Install all project dependencies
2. `npm run build` — Build both frontend and backend assets
3. `npm start` — Start the application server

<!-- nexlayer:end -->

## Nexlayer Setup
<!-- nexlayer:section agent-managed=nexlayer_setup -->
### Pod Environment Variables

| Pod | Variable | Value | Kind |
|-----|----------|-------|------|
| `app` | `NODE_ENV` | `production` | plain |
| `app` | `PORT` | `"3000"` | plain |
| `app` | `HOSTNAME` | `"0.0.0.0"` | plain |
| `app` | `DM_PASSWORD` | _(set via Nexlayer dashboard)_ | secret |
| `app` | `PC_PASSWORD` | _(set via Nexlayer dashboard)_ | secret |

### Secrets Required

Set these in the Nexlayer dashboard before deploying:

- `DM_PASSWORD` (`app` pod)
- `PC_PASSWORD` (`app` pod)

### nexlayer.yaml

```yaml
application:
  name: just-wave-dungeon-revealer
  pods:
    - name: app
      image: "# filled by pipeline"
      path: /
      servicePorts:
        - 3000
      vars:
        NODE_ENV: production
        PORT: "3000"
        HOSTNAME: "0.0.0.0"
        DM_PASSWORD: ""
        PC_PASSWORD: ""
```

<!-- nexlayer:end -->

## Nexlayer Deployment Plan
<!-- nexlayer:section user-editable=deployment_plan -->
### Pod Topology

| Pod | Image | Port | Role |
|-----|-------|------|------|
| dungeon-revealer | mirror.gcr.io/library/node:16-slim | 3000 | web |

### Deployment notes

- The application is a monolithic Node.js server that serves the frontend from the /build directory.
- No external database pod was identified in the provided repository files; the application likely uses local file storage or an embedded store.

<!-- nexlayer:end -->

## Build Notes
<!-- nexlayer:section user-editable=build_notes -->
<!-- Add notes for future builds here — preserved across re-analysis -->
<!-- nexlayer:end -->

## Nexlayer Configuration
<!-- nexlayer:section agent-managed=nexlayer_config -->
**Last deployed:** 2026-06-10T17:29:40Z  
**Live URL:** https://kitbear-studio-just-wave-dungeon-revealer.cloud.nexlayer.ai  
**Runtime:** node · **Port:** 3000  
**Deploy branch:** master  

```yaml
application:
  name: just-wave-dungeon-revealer
  pods:
    - name: app
      image: "# filled by pipeline"
      path: /
      servicePorts:
        - 3000
      vars:
        NODE_ENV: production
        PORT: "3000"
        HOSTNAME: "0.0.0.0"
        DM_PASSWORD: ""
        PC_PASSWORD: ""
```
<!-- nexlayer:end -->

## Build History
<!-- nexlayer:section agent-managed=build_history -->
| Date | Status | Notes |
|------|--------|-------|
| 2026-06-10T17:23:09Z | analyzed | initial repo analysis |
| 2026-06-10T17:29:40Z | success | deployed https://kitbear-studio-just-wave-dungeon-revealer.cloud.nexlayer.ai |
<!-- nexlayer:end -->
