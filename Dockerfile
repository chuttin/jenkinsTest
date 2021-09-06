FROM nginx:alpine
WORKDIR /opt/jenkinsTest/
COPY dist /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/

EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]