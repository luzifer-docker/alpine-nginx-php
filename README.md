# luzifer-docker / alpine-nginx-php

Run nginx and php-fpm in a Docker container using s6 overlay

## Usage

```bash
## Build container (optional)
$ docker build -t luzifer/alpine-nginx-php .

## Execute radicale
$ docker run --rm -ti -v $(pwd):/var/www -p 80:80 luzifer/alpine-nginx-php
```
