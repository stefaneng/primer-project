# Comp 490 Primer Project

[![Build Status](https://travis-ci.org/stefaneng/primer-project.svg?branch=master)](https://travis-ci.org/stefaneng/primer-project)

Project describing a continuous deployment setup with docker.

Uses the github markdown api to render the markdown through a cgi script.

Based on [deploy to your own server through ssh with travis ci](http://neemzy.org/articles/deploy-to-your-own-server-through-ssh-with-travis-ci) and [build docker image in travis-ci](http://docs.travis-ci.com/user/docker/).

See the live version at http://www.csun.edu/~see93462/primer_project/cgi-bin/index.cgi

Template from https://github.com/poole/poole.


## Development Usage
```
docker build -t comp490-primer .
docker run -it --rm -p 8080:80 comp490-primer
```

Now apache will be running on `<docker-host>:8080`
