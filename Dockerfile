FROM ubuntu
MAINTAINER Brian Artschwager brian@artschwager.com
 
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
ADD nginx.conf /etc/nginx/sites-enabled/default

# By default, simply start apache.
CMD /usr/sbin/nginx