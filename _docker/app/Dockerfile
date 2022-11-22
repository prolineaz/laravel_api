FROM php:8.1.12-fpm

RUN apt-get update && apt-get install -y \
      openssh-server \
      cron \
      htop \
      apt-utils \
      libpq-dev \
      libpng-dev \
      libzip-dev \
      zip unzip \
      net-tools \
      iputils-ping \
      vim \
      git && \
      docker-php-ext-install pdo_mysql && \
      docker-php-ext-install bcmath && \
      docker-php-ext-install gd && \
      docker-php-ext-install zip && \
      pecl install -o -f xdebug && \
      docker-php-ext-enable xdebug && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# SSH
RUN sed -ri 's/#PermitEmptyPasswords .*/PermitEmptyPasswords yes/' /etc/ssh/sshd_config
RUN sed -ri 's/#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN /etc/init.d/ssh start
RUN passwd -d root


COPY ./_docker/app/php.ini /usr/local/etc/php/conf.d/php.ini
COPY ./_docker/app/99-xdebug.ini /usr/local/etc/php/conf.d/99-xdebug.ini
RUN sed -ri 's/listen = 127.0.0.1:9000/listen = 127.0.0.1:9009/' /usr/local/etc/php-fpm.d/www.conf
RUN sed -ri 's/listen = 9000/listen = 9009/' /usr/local/etc/php-fpm.d/zz-docker.conf

# Install composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- \
    --filename=composer \
    --install-dir=/usr/local/bin

WORKDIR /var/www

EXPOSE 22 9009

RUN printf "syntax on" >> /root/.vimrc

RUN printf "php-fpm -D\n/usr/sbin/sshd -D" >> /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
