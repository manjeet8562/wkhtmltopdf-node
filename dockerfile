# Use an official Node.js image as a parent image
FROM node:18-bullseye

# Set the working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Install wkhtmltopdf and its dependencies
RUN apt-get update && apt-get install -y \
    wkhtmltopdf \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the rest of your application code
COPY . .

# Expose any ports your app uses
EXPOSE 3000

# Command to run your app
CMD ["npm", "start"]
