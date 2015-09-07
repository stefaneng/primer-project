# Comp 490 Primer Project

[![Build Status](https://travis-ci.org/stefaneng/primer-project.svg?branch=master)](https://travis-ci.org/stefaneng/primer-project)

Project describing a continuous deployment setup with docker.

Uses the github markdown api to render the markdown through a cgi script.

Based on [deploy to your own server through ssh with travis ci](http://neemzy.org/articles/deploy-to-your-own-server-through-ssh-with-travis-ci) and [build docker image in travis-ci](http://docs.travis-ci.com/user/docker/).

See the live version at http://www.csun.edu/~see93462/primer_project/cgi-bin/index.cgi

Template from https://github.com/poole/poole.

## Features
  - Responds to `GET` requests: http://www.csun.edu/~see93462/primer_project/cgi-bin/index.cgi
  - Responds to different URI provided:
    - Main page: http://www.csun.edu/~see93462/primer_project/cgi-bin/index.cgi
    - Template: http://www.csun.edu/~see93462/primer_project/template.html
  - Returns html:
  ```
  $ curl -I http://www.csun.edu/~see93462/primer_project/template.html

   HTTP/1.1 200 OK
   Date: Mon, 07 Sep 2015 21:26:37 GMT
   Server: Apache/2.2.3 (Red Hat)
   Last-Modified: Mon, 07 Sep 2015 19:46:59 GMT
   Accept-Ranges: bytes
   Content-Length: 1123
   Content-Type: text/html
  ```
  - Has a style sheet: http://www.csun.edu/~see93462/primer_project/style.css
  - Consumes information from the file system and presents it with a makeshift template engine.
    - Writes the [date](http://www.csun.edu/~see93462/primer_project/cgi-bin/index.cgi#date) and reads files from the file system.
  - The cgi script uses the [github markdown api](https://developer.github.com/v3/markdown/) to render markdown as html.

## Development Usage
```
docker build -t comp490-primer .
docker run -it --rm -p 8080:80 comp490-primer
```

Now apache will be running on `<docker-host>:8080`
