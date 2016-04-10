FROM    centos:centos6
MAINTAINER Ngo Van Thang <thangnvbkhn@gmail.com>

ENV PHP_HOST php-fpm
ENV PHP_PORT 9000
ENV APP_MAGE_MODE default

# Set TERM env to avoid mysql client error message "TERM environment variable not set" when running from inside the container
ENV TERM xterm

RUN     cp -p /usr/share/zoneinfo/Japan /etc/localtime

# Install common packages
RUN     yum -y \
        install \
        wget \
        curl \
        sudo \
        passwd \
        git \
        openssh-server \
        vim \
        mysql \
        epel*

ADD     remi-release-6.rpm  /usr/local/src/remi-release-6.rpm
RUN     rpm -Uvh /usr/local/src/remi-release-6.rpm

COPY    nginx.repo  /etc/yum.repos.d/nginx.repo

RUN     yum -y install \
        php \
        php-fpm \
        --enablerepo=remi-php56
RUN     yum -y install nginx

COPY    www.conf /etc/php-fpm.d/www.conf

RUN     rm -rf /etc/nginx/conf.d/default.conf
COPY    default.conf /etc/nginx/conf.d/default.conf

# Make web directory
RUN     mkdir -p /srv/nginx && \
        chmod 777 /srv/nginx

# Make folder test
#RUN     mkdir -p /srv/nginx/magento.apdev.local/public && \
#        echo "example docker container nginx server" > /srv/nginx/test.apdev.local/public/index.html

# Make user centos
RUN useradd -m centos
RUN echo "centos:centos" | chpasswd
# Permit centos user to user wheel
RUN gpasswd -a centos wheel

ADD ./m2setup.sh /usr/local/bin/
CMD ["/usr/local/bin/m2setup.sh"]

COPY ./start.sh /usr/local/bin/start.sh
CMD ["/usr/local/bin/start.sh"]

#RUN     service nginx start
#        chkconfig nginx on && \
#        service sshd start && \
#        chkconfig sshd on && \
#        service php-fpm restart && \
#        chkconfig php-fpm on

# Docker側でlistenするポート番号を指定
EXPOSE  80 22