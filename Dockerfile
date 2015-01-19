FROM ubuntu:trusty
MAINTAINER Shaun Martin <shaun@samsite.ca>

VOLUME /var/log/nginx     # access/error logs
VOLUME /var/apt-mirror    # mirrored directories

# expose main config files as volumes in case folk wanna override
VOLUME /etc/nginx/sites-enabled/apt-mirror.conf
VOLUME /etc/apt/mirror.list

# super complex setup process
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install apt-mirror nginx

# inject default config files
ADD resources/nginx/sites-enabled/apt-mirror.conf /etc/nginx/sites-enabled/
ADD resources/apt/mirror.list /etc/apt/mirror.list

# add our startup script
#  - runs apt-mirror
#  - starts nginx
#  - is repeatable in case you want to cron a docker exec call on your host
ADD resources/start.sh /start.sh
ENTRYPOINT /start.sh

