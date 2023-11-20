# create builder image
# FROM registry.access.redhat.com/ubi9/nodejs-18:1-80.1699550448
FROM node

USER root

# set destination work directory
WORKDIR /opt/app-root/src

# copy the app sorces
COPY . /opt/app-root/src

# build application
RUN npm install -g npm@10.2.4
RUN npm install -loglevel silent
RUN npm run build
RUN npm prune

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000
EXPOSE 3000

# CMD mkdir /opt/app-root/src/.nuxt
# CMD chmod 777 /opt/app-root/src/.nuxt

CMD npm run dev

# create working image
# FROM registry.access.redhat.com/ubi9/nodejs-18-minimal:1-85.1699549021
# FROM registry.access.redhat.com/ubi9/nodejs-18:1-80.1699550448

# USER root

# COPY --from=builder /opt/app-root/src/.output /opt/app-root/src/.output

# ENV NUXT_HOST=0.0.0.0
# ENV NUXT_PORT=3000
# EXPOSE 3000

# CMD [ "node", "/opt/app-root/src/.output/server/index.mjs" ]
