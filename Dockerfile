FROM ubuntu

RUN apt-get install -y apache2
RUN a2enmod proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html

# Run!
ENTRYPOINT [ "/usr/sbin/apache2", "-DFOREGROUND" ]
