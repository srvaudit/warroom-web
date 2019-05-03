FROM nginx:1.15.8-alpine

# install dependencies
RUN apk update && apk add --no-cache curl-dev git nodejs-current-npm openssl vim && rm -rf /var/cache/apk/*

# add code
RUN git clone https://github.com/srvaudit/warroom.git /var/www/warroom

# vhost
RUN rm /etc/nginx/conf.d/default.conf
COPY warroom.com.conf /etc/nginx/conf.d/warroom.com.conf.template

# ssl
RUN mkdir /etc/nginx/ssl

COPY start.sh /start.sh
ENTRYPOINT ["/start.sh"]
CMD ["nginx", "-g", "daemon off;"]
