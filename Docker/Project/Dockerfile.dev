# Use node:18-alpine as your base image
FROM docker.io/node:18-alpine

# Set your workdir to /usr/app
WORKDIR /usr/app

# Copy the package.json into the workdir
COPY package.json ./

# Run npm install to install the dependencies
RUN npm install

# Copy the rest of the files into the workdir
COPY . .

# Set the container’s command to npm run serve
CMD ["npm", "run", "serve"]