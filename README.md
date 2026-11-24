# TaskFlow API — Projeto DevOps (Fase 1)

Aplicação REST desenvolvida em FastAPI com pipeline de Integração Contínua (GitHub Actions) e provisionamento de Infraestrutura como Código (Terraform / AWS) projetado para baixa latência na região de São Leopoldo/RS (`sa-east-1`).

## Estrutura do Repositório

```text
DevOps/
├── .github/workflows/ci.yml   # Pipeline de CI (Lint, Testes, Build Docker e Validação Terraform)
├── app/main.py                # API FastAPI com endpoints /health e /tasks
├── tests/test_main.py         # Testes automatizados com Pytest
├── infra/                     # Scripts IaC em Terraform (VPC, Subnet, Security Group, EC2)
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── Dockerfile                 # Empacotamento da aplicação em container
└── requirements.txt           # Dependências Python