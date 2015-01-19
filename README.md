# docker-apt-mirror
Serves an apt mirror with Nginx

## How to...


## Defaults

apt-mirror is configured out of the box to mirror the standard Ubuntu Trusty repos 
plus installation media. If you want to use your own mirrors.list file, override the
default by mounting /etc/apt/mirror.list as a host volume.

nginx is set up to blast out the entire apt mirror over port 80 with as little
interference as possible. Once again, override this by mounting /etc/nginx/sites-
enabled/apt-mirror.list as a host volume. 
