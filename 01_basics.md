### Another Docker Workshop

![Docker Logo](/img/docker-logo.png)

##### The contents of this workshop have been borrowed from the internet. 

---

### Index

[Basics](#/3/)

[Running Containers](#/running-containers)

---

## What is a Docker Container ?

---

> "A container image is a lightweight, stand-alone, executable package of a piece of software that includes everything needed to run it: code, runtime, system tools, system libraries, settings."

---

#### Package software into standardized units for development, shipment and deployment

---

Is basically a virtual machine, right ?

---

Not Really! *funny gif here*

---

#### Comparing Containers and Virtual Machines

![container-infra](/img/01/container-infra.png)
![vm-infra](/img/01/vm-infra.png)
Note:
Containers are an abstraction at the app layer that packages code and dependencies together. Multiple containers can run on the same machine and share the OS kernel with other containers, each running as isolated processes in user space. Containers take up less space than VMs (container images are typically tens of MBs in size), and start almost instantly. 

Virtual machines (VMs) are an abstraction of physical hardware turning one server into many servers. The hypervisor allows multiple VMs to run on a single machine. Each VM includes a full copy of an operating system, one or more apps, necessary binaries and libraries - taking up tens of GBs. VMs can also be slow to boot.

---

### Containers and VM together

![Containers and VMs together](/img/01/containers-vms-together.png)

Note:
Containers are isolated but share OS and, where appropriate bin/libraies. Faster deployment, less overhead, faster restart, easier migration. 

---

## What problem does Docker solve?

---

## The Challenge

![the-challenge](/img/01/the-challenge.png)

---

## The Matrix from Hell

![the-matrix-from-hell](/img/01/the-matrix-from-hell.png)

---

### Container system for code

![shipping-container-for-code](/img/01/shipping-container-for-code.png)

---

### Eliminates the matrix hell

![eliminates-matrix-from-hell](/img/01/eliminates-matrix-from-hell.png)

---

#### Why it works: Separation of Concerns

![separation-of-concerns](/img/01/separation-of-concerns.png)

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

