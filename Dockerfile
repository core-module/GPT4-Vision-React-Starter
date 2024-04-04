# Use the official Node.js 20 Alpine image as a parent image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Install build dependencies required for native dependencies
RUN apk add --no-cache build-base python3 git

# Copy the package.json and yarn.lock from your project into the container
COPY package.json yarn.lock ./

# Install dependencies in the container using Yarn
RUN yarn install --pure-lockfile

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . .

# Expose port 9000 for the Gatsby server
EXPOSE 3000

# Serve the built site with gatsby serve on port 9000
CMD ["yarn", "dev"]
