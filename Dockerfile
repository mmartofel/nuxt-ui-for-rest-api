# Dockerfile
# FROM registry.access.redhat.com/ubi8/nodejs-18:latest
FROM registry.access.redhat.com/ubi9/nodejs-18:1-80.1699550448

# set destination work directory
# WORKDIR /opt/app-root/src

# copy the app sorces
# COPY . /opt/app-root/src

RUN npm install -g npm@10.2.4

# RUN npm install -loglevel silent
RUN npm install
RUN npm run build

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

EXPOSE 3000

CMD [ "npm", "start", "-loglevel silent" ]
