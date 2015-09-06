FROM httpd:2.4

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y curl

COPY ./public_html /usr/local/apache2/htdocs/public_html

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
