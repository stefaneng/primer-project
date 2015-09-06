# Comp 490 Primer Project

Template from https://github.com/poole/poole

## Ideas
  - Write pages with markdown, and send to [github markdown api](https://developer.github.com/v3/markdown/) to render as html.
  - Describe docker in markdown as well.
  - Describe continuous integration and deployment in markdown file.
  - What info to get on the filesystem?

## Contiunous Integration
- [Deploy to server with scp](http://neemzy.org/articles/deploy-to-your-own-server-through-ssh-with-travis-ci)
- [Build docker image in travis-ci](http://docs.travis-ci.com/user/docker/)

### Travis CI
Add environment variables to `.travis.yml` file
```
env:
  global:
    - secure: "..."
    - secure: "..."
    - secure: "..."
    - secure: "..."
```
We can add variables to travis ci environment using the [`travis` command line tool](https://github.com/travis-ci/travis.rb).
```
travis encrypt DEPLOY_HOST=ssh.csun.edu
travis encrypt DEPLOY_PATH=/home/users11/see93462/comp490-primer-project
travis encrypt DEPLOY_USER=<csun-username>
travis encrypt DEPLOY_PASS=<csun-password>
```
Paste those values under the `global` heading the `travis.yml` file.

## Docker Usage
```
docker build -t comp490-primer .
docker run -it --rm -p 8080:80 comp490-primer
```

Now apache will be running on `<docker-host>:8080`
