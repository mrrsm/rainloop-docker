FROM alpine:3.12

# Update and install all dependancies
RUN apk update && apk upgrade \
    && apk add curl \
    && apk add nginx \
    && apk add php7 php7-fpm php7-curl php7-iconv php7-json php7-xml php7-dom php7-openssl php7-pdo php7-pdo_sqlite \
    && rm /etc/nginx/conf.d/default.conf \
    && rm /etc/php7/php-fpm.d/www.conf \
    && mkdir /var/www/rainloop \
    && mkdir /run/nginx

# Copy configs
COPY nginx/rainloop.conf /etc/nginx/conf.d/rainloop.conf
COPY php-fpm/rainloop.conf /etc/php7/php-fpm.d/rainloop.conf

# Download the files
RUN cd /var/www/rainloop \
    && curl -o rainloop-community-latest.zip https://www.rainloop.net/repository/webmail/rainloop-community-latest.zip \
    && unzip rainloop-community-latest.zip \
    && rm rainloop-community-latest.zip \
    && chown -R nginx:nginx /var/www/rainloop

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 80/tcp

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "default" ]