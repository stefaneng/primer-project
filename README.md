# Comp 490 Primer Project

## Ideas
    - Write pages with markdown, and send to [github markdown api](https://developer.github.com/v3/markdown/) to render as html.
    - Describe docker in markdown as well.
    - Describe continuous integration and deployment in markdown file.
    - What info to get on the filesystem?

## Contiunous Integration
  - [Deploy to server with scp](http://neemzy.org/articles/deploy-to-your-own-server-through-ssh-with-travis-ci)
- [Build docker image in travis-ci](http://docs.travis-ci.com/user/docker/)

## Docker Usage
```
docker build -t comp490-primer .
docker run -it --rm -p 8080:80 comp490-primer
```

Now apache will be running on `<docker-host>:8080`
