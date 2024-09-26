FROM node:16-buster-slim

ENV NODE_ENV=development

RUN apt-get update \
  && apt-get install -y build-essential \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app/services/react_k8s

# Copy package.json and package-lock.json into /app/client_swp
COPY services/react_k8s/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code into /app/client_swp
COPY services/react_k8s ./

# Copy the start script and make it executable
COPY ./compose/ui/start.sh /start-webpack.sh
RUN sed -i 's/\r$//g' /start-webpack.sh
RUN chmod +x /start-webpack.sh


EXPOSE 3000

ENTRYPOINT ["/start-webpack.sh"]
