# Comp 490 Primer Project

## Continous Integration
  - [Deploy to server with scp](http://neemzy.org/articles/deploy-to-your-own-server-through-ssh-with-travis-ci)
- [Build docker image in travis-ci](http://docs.travis-ci.com/user/docker/)

## Docker Usage
```
docker build -t comp490-primer .
docker run -it --rm -p 8080:80 comp490-primer
```

Now nginx will be running on `<docker-host>:8080`
