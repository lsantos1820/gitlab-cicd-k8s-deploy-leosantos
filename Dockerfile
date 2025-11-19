# 🔹 Stage 1: instalar dependências (builder)
FROM node:20-alpine AS deps

# Definimos o diretório de trabalho
WORKDIR /usr/src/app

# Copiamos apenas os manifests de dependências
COPY ./app/package*.json ./

# Instalação limpa e previsível das dependências (apenas produção)
RUN npm ci --omit=dev

# 🔹 Stage 2: imagem final de runtime
FROM node:20-alpine

# Diretório de trabalho da aplicação
WORKDIR /usr/src/app

# Criar usuário e grupo não-root para rodar a app com mais segurança
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copiar as dependências instaladas no stage anterior
COPY --from=deps /usr/src/app/node_modules ./node_modules

# Copiar o código-fonte da aplicação
COPY ./app .

# Variável de ambiente para indicar modo produção
ENV NODE_ENV=production

# Porta exposta pela aplicação
EXPOSE 3000

# Trocar para o usuário não-root
USER appuser

# Comando padrão para iniciar a aplicação
CMD ["npm", "start"]
