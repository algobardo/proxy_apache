FROM ubuntu

RUN apt-get install -y apache2
RUN a2enmod proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html

COPY ./proxy.conf /etc/apache2/sites-enabled/002-proxy.conf

RUN  sed -i -e s/GITLAB_HOST/$GITLAB_HOST/g /etc/apache2/sites-enabled/002-proxy.conf
