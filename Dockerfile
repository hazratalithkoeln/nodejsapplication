# Use an official Node.js runtime as a parent image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
# RUN npm install
RUN npm install express

# Copy the rest of the application code to the container
COPY . .

# Expose the application port
EXPOSE 8000

# Define the command to run your application
CMD ["node", "app.js"]
