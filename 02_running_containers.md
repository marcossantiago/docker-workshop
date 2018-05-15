### Running Containers

---

### Let's run a webserver

`docker run --name mywebserver nginx`

---

We dont' want to be attached to its console

`docker rm mywebserver`

---

Run in the background using `-d` for `detach` mode

`docker run -d --name mywebserver nginx`

---

SSH (?) into the container ?

`docker exec -it mywebserver /bin/bash`

```sh
$ apt-get update ; apt-get -y install curl
$ curl localhost:80
$ exit
```

Will the container die when exit ?

---

If you now do `docker ps` you'll notice the mywebserver container is still running. It didn't stop because the main process, the nginx process (with pid 1), is still running. The process you killed by quitting was just the /bin/bash shell.

---

mywebserver is running on port 80.

```s
CONTAINER ID  IMAGE STATUS          PORTS     NAMES
e51cb3af616c  nginx Up 12 minutes   80/tcp    mywebserver
```

From the host try `$ curl localhost:80`

---

```s
curl: (7) Failed to connect to localhost port 80: Connection refused
```

---

Inspect the container

`docker inspect mywebserver`

```json
"Gateway": "172.17.0.1",
"IPAddress": "172.17.0.3",
```

---

Check the container on port 80

`curl 172.17.0.3:80`

```html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
```

---

Another webserver

`docker run -d --name otherweb --publish 80 nginx`

Try curl again:

`$ curl localhost:80`

Check the port using `docker ps` again

---

Last try

`docker run -d --name lastweb --publish 80:80 nginx`

Last time. Try curl again:

`$ curl localhost:80`

---

Access the host on the browser and check the logs:

`docker logs --follow lastweb`

---

### PORTS

Basically, you have three options:

* Don't specify anything
* Only specify EXPOSE (image level).
* Specify EXPOSE and --publish

Note:
If you do not specify any of those, the service in the container will not be accessible from anywhere except from inside the container itself.

If you EXPOSE a port, the service in the container is not accessible from outside Docker, but from inside other Docker containers. So this is good for inter-container communication.

If you EXPOSE and -p a port, the service in the container is accessible from anywhere, even outside Docker.

---

Iptables under the hood

`sudo iptables -t nat -L -n`

```
DNAT 0.0.0.0/0   tcp dpt:32768 to:172.17.0.3:80
DNAT 0.0.0.0/0   tcp dpt:80 to:172.17.0.4:80
```

---