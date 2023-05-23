FROM alpine:latest

# Install required packages
RUN apk add --no-cache nodejs npm

# Install Stoplight Prism Swagger UI & deps
RUN npm install -g @stoplight/prism-cli && \
    mkdir -p /app/server && cd /app/server \
    npm init --yes && \
    npm install express swagger-ui-dist

# Set working directory
WORKDIR /app

# Copy spec files from host to container
COPY ./Trabajos/openapi/openapi.yaml /app
# Copy server files from host to container
COPY ./docker/server.js /app/server

# Copy Swagger UI custom initializer to container
COPY ./docker/swagger-initializer.js /app/server
# replacing file in swagger-ui-dist
RUN cat /app/server/swagger-initializer.js > /app/server/node_modules/swagger-ui-dist/swagger-initializer.js
# Copy api spect to swagger-ui-dist package
RUN cp /app/openapi.yaml /app/server/node_modules/swagger-ui-dist/openapi.yaml

RUN rm -rf /app/server/swagger-initializer.js
# Expose ports
EXPOSE 4010
EXPOSE 8080

# Start Stoplight Prism and Swagger UI custom server
CMD prism mock --cors -h 0.0.0.0 "/app/openapi.yaml" --port 4010 & node /app/server/server.js