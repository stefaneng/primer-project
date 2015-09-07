# Primer Project

This is a primer project for Comp 490.
It is mostly documentation on the simple continuous integration/deployment of a github project using [travis-ci](https://travis-ci.org/) and [docker](https://www.docker.com/) for local testing.
The backend is a cgi script that uses the [github markdown api](https://developer.github.com/v3/markdown/) to render markdown as html.
Adding a query string of [`"?raw=true"`](http://www.csun.edu/~see93462/primer_project/cgi-bin/index.cgi?raw=true) will return the raw markdown.
The code is available at [https://github.com/stefaneng/primer-project](https://github.com/stefaneng/primer-project).

## Continuous Integration

Continuous integration allows for an automation of builds and tests.
It is commonly abbreviated as CI.
The CI system used in this project is called [Travis CI](https://travis-ci.org/) which works as a github hook to build, run and test code on every commit.
Getting Travis CI set up for a project is easy.
All you have to do is enable access through your github account and tell Travis to watch the project.
Then write a `.travis.yml` file at the root of the repository which tells the Travis machines how to build your project.
This project's `.travis.yml` file is located [here](https://github.com/stefaneng/primer-project/blob/master/.travis.yml).
Once everything is working you will have a status like this: [![Build Status](https://travis-ci.org/stefaneng/primer-project.svg?branch=master)](https://travis-ci.org/stefaneng/primer-project) next to all commits.
This allows for a team to track what commit broke the build.


## Continuous Deployment

Continuous deployment takes CI one step further and deploys builds automatically when they build and pass a test suite.
This example project builds and tests the project with a docker builds, and if the build was successful, pushes and deploys the code to the CSUN servers.
This setup was based on the blog post [deploy to your own server through ssh with travis ci](http://neemzy.org/articles/deploy-to-your-own-server-through-ssh-with-travis-ci).
Basically, what we want is for when the build is successful on Travis CI, it will bundle up the code, scp it over to the csun servers and deploy it.
See any problems with this?
We can't just commit our password to run scp.
Instead we can use a feature of Travis CI that allows us to encrypt environment variables.
Then we can tell Travis CI to use `sshpass` to read from the environment variables instead of the command line.
We can add variables to travis ci environment using the [`travis` command line tool](https://github.com/travis-ci/travis.rb).

```
travis encrypt DEPLOY_HOST=ssh.csun.edu
travis encrypt DEPLOY_PATH=/home/users11/see93462/comp490-primer-project
travis encrypt DEPLOY_USER=<csun-username>
travis encrypt DEPLOY_PASS=<csun-password>
```

Paste those values under the `global` heading the `travis.yml` file.

Now the `.travis.yml` should look something like:

```
env:
  global:
    - secure: "..."
    - secure: "..."
    - secure: "..."
    - secure: "..."
```

Now if we look at the [`package.sh`](https://github.com/stefaneng/primer-project/blob/master/package.sh) script,
```
#! /bin/bash

# Package all apache public stuff
tar -zcf package.tgz public_html

# Put the encrypted password as environment variable for ssh pass
export SSHPASS=$DEPLOY_PASS

# Send package.tgz and deploy.sh to server
sshpass -e scp -o stricthostkeychecking=no package.tgz $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH
sshpass -e scp -o stricthostkeychecking=no deploy.sh $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH

# Run the deploy script
sshpass -e ssh -o stricthostkeychecking=no $DEPLOY_USER@$DEPLOY_HOST $DEPLOY_PATH/deploy.sh
```

We can see how we are deploying to CSUN's servers.

You can see the final product of the `.travis.yml` file [here](https://github.com/stefaneng/primer-project/blob/master/.travis.yml)
