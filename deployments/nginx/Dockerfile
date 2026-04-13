FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf
# this is not needed as the certificates will be passed as volumes in the docker-compose file
# COPY certs/ /etc/nginx/ssl/

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]