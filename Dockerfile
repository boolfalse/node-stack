
# define the base image
FROM node:18

# Create woking app directory
WORKDIR /usr/src/app

# Copy necessary files to the working directory (package.json, package-lock.json)
COPY package*.json ./

# Install dependencies
RUN npm install

# Prisma setup
COPY prisma/schema.prisma ./prisma/
RUN npx prisma generate

# Copy all files from the current directory to the working directory
COPY . .

# Expose port 3003 to the outside world
EXPOSE 3003

# Run the app
CMD ["npm", "run", "start"]
