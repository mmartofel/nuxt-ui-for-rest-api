# Dockerfile
# FROM registry.access.redhat.com/ubi8/nodejs-18:latest
FROM registry.access.redhat.com/ubi9/nodejs-18:1-80.1699550448 as builder

USER root

RUN id
# set destination work directory
WORKDIR $HOME
RUN pwd
RUN ls

# copy the app sorces
COPY . $HOME

RUN pwd
RUN ls


RUN npm install -g npm@10.2.4

RUN chown -R default:root ./*
RUN pwd
RUN ls -al

# RUN npm install -loglevel silent
RUN npm install

RUN pwd
RUN ls

FROM registry.redhat.io/rhel8/nodejs-18-minimal:1-86

USER root
WORKDIR $HOME

COPY --from=builder $HOME $HOME

RUN pwd
RUN ls -al /opt/app-root/src/package-lock.json

RUN npm run build

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

EXPOSE 3000

CMD [ "npm", "start", "-loglevel silent" ]
