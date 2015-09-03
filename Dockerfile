FROM httpd:2.4

RUN apt-get update && apt-get install -y python2.7

COPY ./public_html/ /usr/local/apache2/htdocs/

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
