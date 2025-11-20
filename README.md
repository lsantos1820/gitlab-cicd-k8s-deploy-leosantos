# 🚀 Pipeline CI/CD com GitLab, Docker e Kubernetes

Este projeto implementa um pipeline completo de CI/CD utilizando **GitLab**, **Docker** e **Kubernetes**, onde uma aplicação Node.js é construída, testada, empacotada em container e implantada automaticamente em um cluster Kubernetes.

## 🏆 Objetivo do Projeto

Este repositório foi desenvolvido como parte do desafio prático da DIO, aprimorado com boas práticas profissionais de DevOps e Cloud Engineering.  
O objetivo é demonstrar experiência real com:

- CI/CD utilizando **GitLab Pipelines**
- Build e publicação de imagens Docker
- Deploy automatizado no Kubernetes (`kubectl apply`)
- Manifests Kubernetes (Deployment + Service)
- Ambientes versionados e controlados por branch

---

## 🏗 Arquitetura da Solução


### Fluxo resumido

1. O código é atualizado e enviado para o GitHub
2. O GitLab CI é acionado
3. Stage `test`: executa `npm test`
4. Stage `docker`: build da imagem e push para o Container Registry
5. Stage `deploy`: aplica manifests Kubernetes substituindo automaticamente a imagem construída
6. Novo deploy da aplicação é efetuado no cluster

📦 **Tecnologias utilizadas**
| Tecnologia | Função |
|-----------|--------|
| Git & GitHub | Versionamento e portfólio |
| GitLab CI/CD | Pipeline de automação |
| Node.js | Aplicação |
| Docker | Empacotamento |
| Kubernetes | Orquestração |
| kubectl | Deploy |
| kind/minikube (opcional) | cluster local para testes |

---

## 📁 Estrutura de Diretórios

gitlab-cicd-app-base/
├── app/ # Código da aplicação Node
├── k8s/ # Manifests kubernetes
│ ├── deployment.yaml
│ └── service.yaml
├── Dockerfile # Container multi-stage
├── .gitlab-ci.yml # pipeline CI/CD
├── .dockerignore
└── README.md

