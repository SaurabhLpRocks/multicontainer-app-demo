# FROM nginx:alpine
# LABEL author="Saurabh Palatkar"
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY dist/ ./usr/share/nginx/html

# # RUN ps aux | grep nginx
# # RUN chown -R root:root /usr/share/nginx/html/index.html
# # RUN chmod -R 755 /usr/share/nginx/html
# # RUN ls -al /usr
# # RUN chmod o+x /usr
# # RUN chmod o+x /usr/share
# # RUN chmod o+x /usr/share/nginx
# # RUN chmod o+x /usr/share/nginx/html
# # RUN ls /usr/share/nginx/html
# EXPOSE 80 443
# CMD [ "nginx", "-g", "daemon off;" ]

FROM node:8.12.0

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH
# install and cache app dependencies
COPY package.json /usr/src/app/package.json
COPY package-lock.json /usr/src/app/package-lock.json
RUN npm install
RUN npm install -g @angular/cli@6.2.0

# add app
COPY . /usr/src/app

EXPOSE 4200 443
CMD ["ng", "--host=0.0.0.0", "serve"]