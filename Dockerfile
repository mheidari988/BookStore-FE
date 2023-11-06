# Step 1: Use the official Node.js 16 image as the base image
FROM node:18 as build-step

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json (if available) to the container
COPY package*.json /app/

# Install all the dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . /app

# Build the application
RUN npm run build

# Step 2: Use Nginx to serve the application
FROM nginx:alpine

# Copy the build output to replace the default nginx contents.
COPY --from=build-step /app/dist/* /usr/share/nginx/html/

# Expose port 80 to the outside once the container has launched
EXPOSE 80

# Define the command to run your app using CMD which defines your runtime
CMD ["nginx", "-g", "daemon off;"]
