FROM ubuntu
MAINTAINER Brian Artschwager brian@artschwager.com

RUN apt-get update
#RUN apt-get -y upgrade
 
RUN apt-get install -y nginx git

# create/modify files
RUN mkdir /app
RUN mkdir /app/logs
RUN touch /app/logs/nginx-access.log
WORKDIR /app

# code repository
CMD git clone https://github.com/artschwagerb/nginx-docker.git /app

# copy configuration files
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
CMD cp /app/nginx/. /etc/nginx/sites-enabled/

# expose HTTP
EXPOSE 80

# Run
CMD /usr/sbin/nginx -c /etc/nginx/nginx.conf