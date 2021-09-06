FROM nginx:alpine
WORKDIR /opt/jenkinsDemo/
COPY dist /usr/share/nginx/html/
EXPOSE 80