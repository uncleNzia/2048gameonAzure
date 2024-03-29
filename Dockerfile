ROM ubuntu:22.04
# Update and install packages in the base OS (ubuntu)
RUN apt-get update -y && apt-get install -y zip nginx curl

#COnfigure nginx to run in the forground
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Download and set up the 2048 game
RUN mkdir -p /var/www/html \
    && curl -o /var/www/html/master.zip -L https://codeload.github.com/gabriele>
    && cd /var/www/html \
    && unzip master.zip \
    && mv 2048-master/* . \
    && rm -rf 2048-master master.zip

EXPOSE 80

# Start nginx in the background
CMD  ["/usr/sbin/nginx"]
