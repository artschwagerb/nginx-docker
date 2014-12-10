FROM debian
MAINTAINER Brian Artschwager brian@artschwager.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y upgrade
 
RUN apt-get install -y nginx

# create/modify files
RUN mkdir /app
RUN mkdir /app/logs
RUN touch /app/logs/nginx-access.log
WORKDIR /app

# code repository
ADD certificates /app/certificates
ADD www /app/www

# copy configuration files
ADD nginx /etc/nginx/sites-enabled

# By default, simply start apache.
CMD /usr/sbin/nginx