# Install the application dependencies in a full UBI Node docker image
FROM registry.access.redhat.com/ubi9/nodejs-18:latest AS base

# Elevate privileges to run npm
USER root

# Copy package.json and package-lock.json
COPY package*.json ./

# Upgrade npm first
RUN npm install -g npm@10.2.4

# Install app dependencies
RUN npm install

# Copy the dependencies into a minimal Node.js image
FROM registry.access.redhat.com/ubi9/nodejs-18-minimal:latest AS final

# Install app dependencies
COPY --from=base /opt/app-root/src/node_modules /opt/app-root/src/node_modules
COPY . /opt/app-root/src

# Elevate privileges to change owner of source files
USER root
RUN chown -R 1000750000:0 /opt/app-root/src

# Restore default user privileges
USER 1000750000

# Run application in 'development' mode
ENV NODE_ENV development

# Listen on port 3000
ENV PORT 3000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000
EXPOSE 3000

# Start node process
CMD npm run dev