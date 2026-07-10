# DOCKER-CI

API REST em Go (Gin + GORM) para cadastro de alunos, com PostgreSQL, containerizada em Docker — mas o foco real do repositório são os **pipelines de CI/CD** no GitHub Actions: build/teste, build de imagem Docker, deploy em EC2, deploy em ECS e teste de carga.

## Stack

- **Go** + **Gin** — API REST
- **GORM** + **PostgreSQL** — persistência
- **Docker** / **docker-compose** — Postgres + pgAdmin locais
- **GitHub Actions** — CI/CD

## Pipelines (`.github/workflows`)

| Workflow | O que faz |
|---|---|
| `go.yml` | Build e testes (`go test`) |
| `Docker.yml` | Build da imagem Docker |
| `EC2.yml` | Deploy em instância EC2 |
| `ECS.yml` | Deploy no Amazon ECS |
| `LoadTest.yml` | Teste de carga |

## Endpoints

- `GET /alunos` — lista todos
- `POST /alunos` — cria um aluno
- `GET /alunos/:id` — busca por ID
- `PUT /alunos/:id` — edita
- `DELETE /alunos/:id` — remove
- `GET /alunos/cpf/:cpf` — busca por CPF
- `GET /` — página index em HTML

## Rodando localmente

```bash
docker-compose up -d   # sobe Postgres + pgAdmin
go run main.go         # inicia a API em :8000
```

## Estrutura

```
controllers/        handlers HTTP
database/           conexão com Postgres (GORM)
models/              modelo Aluno + validação
templates/           página index
.github/workflows/  pipelines de CI/CD
```
