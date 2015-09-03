FROM httpd:2.4

RUN apt-get update && apt-get install -y python

COPY ./public_html/ /usr/local/apache2/htdocs/

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
