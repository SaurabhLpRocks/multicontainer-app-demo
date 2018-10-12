FROM nginx:alpine
LABEL author="Saurabh Palatkar"
COPY nginx.conf /etc/nginx/nginx.conf

COPY /dist /usr/share/nginx/html
RUN ls /usr/share/nginx/html

# RUN ps aux | grep nginx
# RUN chown -R root:root /usr/share/nginx/html/index.html
# RUN chmod -R 755 /usr/share/nginx/html
# RUN ls -al /usr/share/nginx/html/
# RUN chmod o+x /usr
# RUN chmod o+x /usr/share
# RUN chmod o+x /usr/share/nginx
# RUN chmod o+x /usr/share/nginx/html
# RUN ls /usr/share/nginx/html
EXPOSE 80 443
CMD [ "nginx", "-g", "daemon off;" ]