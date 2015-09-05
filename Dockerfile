FROM httpd:2.4

COPY ./public_html /usr/local/apache2/htdocs/public_html

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
