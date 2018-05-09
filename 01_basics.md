## Docker Workshop

---

## What is a Docker Container ?

Briefly explain

---

## FUNDAMENTALS

---

Let's run a simple container:

```sh
$ docker run hello-world

```
Note:
What just happened ? What can you see ? Pulled image and run the container.

---

That was easy. Let's check the container:

```sh
$ docker ps
```
Note:
Why you cannot see the container listed ?

---

Nothing there. Let's try again with `-a` flag

```sh
$ docker ps -a 
```

---

Running a real OS now.

```sh
$ docker run ubuntu:17.10
```

What will happen if you run `$ docker ps`?

Note:
Run `docker ps -a` to see the container.

---

So it stops after it runs? Let's try something else:

```sh
$ docker run -it ubuntu:17.10
```

---

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
$ docker run -it ubuntu:17.10
$ figlet "Docker is awesome"
```

---

What's different from the previous run ?
Why figlet fails now ?

Note: 
Interactive, tag, new container.

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
