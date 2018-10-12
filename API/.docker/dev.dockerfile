FROM node:8.12.0-alpine

LABEL author="Saurabh Palatkar"

# specify the working directory
WORKDIR app

# install app dependencies
COPY package.json .
COPY package-lock.json .
RUN npm install && npm i gulp --g

# add files to the container
COPY . .

# expose app port
EXPOSE 5000

# run application
CMD ["npm", "start"]