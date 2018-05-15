## Docker Images

---

> A docker image is made of one or more layers. Each layer is built on top of the previous one and they're all immutable. This means you can't modify an existing layer, instead you create a new one made of changes from the previous layer.

---

Docker Layers

![docker-layers](/img/03/docker-layers.png)

---

Multiple containers

![docker-layers-busybox](/img/03/docker-layers-busybox.png)

---

### Building an image

In order to build an image, you will need a `Dockerfile`.

Go to the folder `labs/webserver` in the repository.

---

Simple Dockerfile

```dockerfile
FROM ubuntu:latest
MAINTAINER Marcos Santiago

RUN apt-get update
RUN apt-get install -y nginx

# COPY index.html /var/www/html/
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

---

Build the image

`docker build --tag myfirstimage .`

Run the a container

`docker run --rm -d --name myweb -p 80:80 myfirstimage`

Curl

`curl localhost:80`

---

Change the Dockerfile

```dockerfile
FROM ubuntu:latest
MAINTAINER Marcos Santiago

RUN apt-get update
RUN apt-get install -y nginx

COPY index.html /var/www/html/
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

Rebuild and run the container

```sh
docker build --tag myfirstimage .
docker stop myweb  
docker run --rm -d --name myweb -p 80:80 myfirstimage
curl localhost:80
```

---

### Layers

* Each instruction (FROM, RUN, etc.) generates a single, immutable layer.

* The second build took less time.

* Docker caches each layer and doesn't re-build them if the build context and layer creation command didn't change since the last build.

---

Image Layers

![image-layers](/img/03/image-layers.png)

---

Our layers

`docker history myfirstimage`

```
IMAGE               CREATED             CREATED BY                                     SIZE  
86a00c21fed6        12 minutes ago      /bin/sh -c #(nop)  CMD ["nginx" "-g" "daemon   0B
0c468638624d        12 minutes ago      /bin/sh -c #(nop)  EXPOSE 80                    0B
cae2138ed4bf        12 minutes ago      /bin/sh -c #(nop) COPY file:ce72c0ac19b4d4ea   134B
579375289bff        23 minutes ago      /bin/sh -c apt-get install -y nginx             57.5MB
d47f9f2e8254        23 minutes ago      /bin/sh -c apt-get update                       40.1MB
91a727f68456        23 minutes ago      /bin/sh -c #(nop)  MAINTAINER Marcos Santiago   0B
452a96d81c30        2 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B
<missing>           2 weeks ago         /bin/sh -c mkdir -p /run/systemd && echo 'do   7B
<missing>           2 weeks ago         /bin/sh -c sed -i 's/^#\s*\(deb.*universe\)$   2.76kB
<missing>           2 weeks ago         /bin/sh -c rm -rf /var/lib/apt/lists/*          0B
<missing>           2 weeks ago         /bin/sh -c set -xe   && echo '#!/bin/sh' > /   745B
<missing>           2 weeks ago         /bin/sh -c #(nop) ADD file:81813d6023adb66b8   79.6MB
```