## Docker

---

### Index

[Basics](#/3/)
[Running Containers](#/running-containers)

---

## What is a Docker Container ?

---

## What problem does Docker solve ?

---

## Hands On!

---

Let's run a simple container

```sh
docker run hello-world
```
Note:
What just happened ? What can you see ? Pulled image and run the container.

---

That was easy. Let's check the container:

```sh
docker ps
```
Note:
Why you cannot see the container listed ?

---

Nothing there. Let's try again with `--all` flag

```sh
docker ps --all
```

---

Running a real OS now.

```sh
docker run ubuntu:17.10
```

What will happen if you run `$ docker ps`?

Note:
Run `docker ps -a` to see the container.

---

So it stops after it runs? Let's try something else:

```sh
docker run --interactive --tty ubuntu:17.10 /bin/bash
```

We're now inside the container. Try:

```sh
$ hostname
2c69fd770274
$ apt-get update
$ apt-get install figlet -y
$ figlet "Docker is awesome"
$ exit
```

---

Try again:

```sh
docker run -it ubuntu:17.10 /bin/bash
figlet "Docker is awesome"
exit
```

---

What's different from the previous run ?

Why figlet fails now ?

Container has died :/

Note: 
Interactive, tag, new container, ephemeral, stateless.

---

### Interactive mode

`-it` specifies you want to go into the interactive mode

* i is interactive
* t is for docker to allocate a pseudo TTY interface for the interaction

---

### Tags

`:17.10` specifies the tag on the ubuntu repository.

Let's check other tags on:

https://hub.docker.com/_/ubuntu/

---

### Images

Get a base image

```sh
docker pull ubuntu:latest
```

List all images:
```sh
docker images
```

---

Pull the other images:

```sh
docker pull ubuntu:18.04
docker pull ubuntu:bionic
docker images
```

What's the difference in between latest, 18.04 and bionic?

Note:
Image ID should be the same.

---

### Recap

* docker commands: run, images, pull, ps
* interactive mode and tags
* docker hub
* ephemeral

---

