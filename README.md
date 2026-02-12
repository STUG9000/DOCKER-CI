# docker-ci

Pipeline de **Integração Contínua (CI)** para aplicações em **Go**, com execução automática de testes, build do projeto e criação de imagens Docker utilizando **GitHub Actions**.

Este repositório foi criado com o objetivo de estudar e aplicar conceitos reais de **DevOps**, automação e boas práticas de CI/CD.

---

## 📌 Sobre o projeto

O fluxo do pipeline é dividido em três etapas principais:

### ✅ Testes automatizados
- O workflow inicia um container **PostgreSQL** com Docker Compose.
- Aguarda o banco ficar disponível.
- Executa os testes do projeto em múltiplas versões do Go.

### ✅ Build da aplicação
- Após os testes passarem, o projeto é compilado.
- O resultado do build é salvo como um **artifact**, permitindo que outros jobs utilizem exatamente o mesmo arquivo gerado.

### ✅ Build e Push da imagem Docker
- Um workflow reutilizável baixa o artifact.
- Realiza login no Docker Hub.
- Cria a imagem Docker da aplicação.
- Publica a imagem automaticamente com uma tag baseada no nome da branch.

---

## 🚀 Tecnologias utilizadas

- **Go**
- **Docker**
- **Docker Compose**
- **PostgreSQL**
- **GitHub Actions**
- **Docker Hub**

---

## ⚙️ Como funciona o pipeline

```text
Test → Build → Docker Build → Push da imagem
1️⃣ Test

Sobe o banco PostgreSQL

Valida a conexão

Executa:

go test ./...
2️⃣ Build

Compila o projeto após os testes passarem.

O artifact gerado é compartilhado entre os jobs para garantir consistência no deploy.
3️⃣ Docker

Workflow reutilizável responsável por:

baixar o artifact

buildar a imagem

enviar para o Docker Hub
