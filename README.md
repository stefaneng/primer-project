# Comp 490 Primer Project

## Docker Usage
```
docker build -t comp490-primer .
docker run -it --rm -p 8080:80 comp490-primer
```

Now nginx will be running on `<docker-host>:8080`
