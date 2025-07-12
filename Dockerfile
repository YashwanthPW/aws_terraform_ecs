# Use Node Alpine base image
FROM node:20-alpine

# Create app directory
WORKDIR /app

# Copy dependency files first for caching
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Build the app and run any migrations
RUN npm run build && npm run predeploy

# Expose the Medusa backend port
EXPOSE 9000

# Start the Medusa server
CMD ["sh", "-c", "cd .medusa/server && npm install && npm run start"]
