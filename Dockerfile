# one
FROM node:lts as one
WORKDIR /src/
COPY . .
RUN apt-get update;\
    apt-get install --yes --no-install-recommends make;\
    npm install --global pnpm;\
    make install;\
    make build
# two
FROM nginx
COPY --from=one /src/dist/ /usr/share/nginx/html/
