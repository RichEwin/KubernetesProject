# Base image video-blog is built from, pulled from Docker Hub
FROM node:10

# Working directory 
WORKDIR /usr/src/app

# Copy and install video-blog dependencies 
COPY package.json .

# Build 
RUN npm install --only=prod

# Copy video-blog contents
COPY . . 

# Expose port
EXPOSE 3000

# Start video-blog
CMD ["npm","start"]