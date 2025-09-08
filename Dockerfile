# Estágio 1: Build da aplicação React
FROM node:20-alpine AS build

# Define o diretório de trabalho
WORKDIR /app

# Copia o package.json e o package-lock.json (se existir)
COPY package.json ./

# Instala as dependências
# Usamos --legacy-peer-deps para evitar possíveis conflitos de versão com dependências mais antigas
RUN npm install --legacy-peer-deps

# Copia o resto do código-fonte da aplicação
COPY . .

# Executa o script de build
RUN npm run build

# Estágio 2: Servir a aplicação com Nginx
FROM nginx:stable-alpine

# Copia os arquivos estáticos gerados no estágio de build para o diretório padrão do Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Copia o arquivo de configuração customizado do Nginx
# Lembre-se de renomear nginx.conf.txt para default.conf ou ajustar o caminho no seu setup
COPY .docker/nginx.conf /etc/nginx/conf.d/default.conf

# Expõe a porta 80 para acesso externo
EXPOSE 80

# Comando para iniciar o Nginx em modo foreground quando o container for executado
CMD ["nginx", "-g", "daemon off;"]