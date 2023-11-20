# Install the application dependencies in a full UBI Node docker image
FROM registry.access.redhat.com/ubi8/nodejs-18:latest AS base

# Elevate privileges to run npm
USER root

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install -loglevel silent
RUN npm run build
RUN npm prune

# Copy the dependencies into a minimal Node.js image
FROM registry.access.redhat.com/ubi8/nodejs-18-minimal:latest AS final

# Restore default user privileges
USER 1000750000

COPY --from=builder /opt/app-root/src/.output /opt/app-root/src/.output
RUN chown -R 1000750000:0 /opt/app-root/src

# Run application in 'development' mode
ENV NODE_ENV development

# Listen on port 3000 at all interfaces
ENV PORT 3000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000
EXPOSE 3000

# Start node process
CMD [ "node", "/opt/app-root/src/.output/server/index.mjs" ]USER root