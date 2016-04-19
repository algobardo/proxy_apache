FROM ubuntu:15.10

RUN apt-get -y update
RUN apt-get install -y apache2 wget
RUN a2enmod proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html
#RUN rm /etc/apache2/sites-enabled/000-default.conf
ADD proxy.conf /etc/apache2/sites-enabled/001-proxy.conf
RUN service apache2 restart

EXPOSE 80

# Run!
ENTRYPOINT [ "/usr/sbin/apache2ctl", "-DFOREGROUND" ]
