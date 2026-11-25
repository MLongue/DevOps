# Arquitetura e Evolução Contínua — Projeto DevOps

## 1. Itens de Configuração (Baseline)
- **Aplicação:** Node.js v20 + Express (rotas `/`, `/health` e `/metrics`)
- **Infraestrutura como Código (IaC):** `infra/devops-infra.yaml`
- **Containerização:** `Dockerfile` (`node:20-alpine`, usuário `node`, `HEALTHCHECK`)
- **Orquestração e Observabilidade:** `docker-compose.yml` + `monitoring/prometheus.yml` (Prometheus :9090 e Grafana :3001)
- **Automação e CI/CD:** `scripts/deploy.sh` e `.github/workflows/devops.yml`

## 2. Fluxo DevOps
```mermaid
flowchart LR
    A[Push / PR no GitHub] --> B[CI: Testes + Validação IaC]
    B --> C[Segurança: npm audit]
    C --> D[Docker Build]
    D --> E[Segurança: Scan Trivy]
    E --> F[Registry: Push Docker Hub]
    F --> G[CD: Deploy Automatizado + /health]
    G --> H[Monitoramento: Prometheus + Grafana]
    H -.->|Feedback Contínuo| A