# Dockerfile
FROM registry.access.redhat.com/ubi9/nodejs-18:1-80.1699550448 as builder

USER root

# set destination work directory
WORKDIR $HOME

# copy the app sorces
COPY . $HOME

RUN npm install -g npm@10.2.4

RUN npm install -loglevel silent
RUN npm run build
RUN npm prune

FROM registry.redhat.io/rhel8/nodejs-18-minimal:1-86

COPY --from=builder /src/.output /src/.output

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

EXPOSE 3000

CMD [ "node", "index.mjs" ]
