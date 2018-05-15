### Docker compose

Allows you to easily build and launch multiple containers.

Go to folder `labs/compose`

---

Docker compose file

```yaml
version: '2'
services:
  app:
    build:
      context: ./app
    depends_on:
      - redis
    environment:
      - REDIS_HOST=redis
    ports:
      - "5000:5000"
    links:
      - redis

  redis:
    image: redis:3.2-alpine
    volumes:
      - redis_data:/data

volumes:
  redis_data:
```

---

app Dockerfile

```dockerfile
FROM python:3.5.2-alpine

ENV REDIS_PORT 6379
ENV BIND_PORT 5000

COPY ./requirements.txt /requirements.txt
COPY ./app.py /app.py

RUN pip install -r /requirements.txt

EXPOSE $BIND_PORT

CMD [ "python", "/app.py" ]
```

---

app.py

```python
import os
from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(host=os.environ['REDIS_HOST'], port=os.environ['REDIS_PORT'])
bind_port = os.environ['BIND_PORT']

@app.route('/')
def hello():
    redis.incr('hits')
    return 'Hello World! I have been seen {} times.'.format(redis.get('hits'))

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
```

---

Build

`docker-compose build`

Run 

`docker-compose up -d`

Test
```
$ curl localhost:5000                                                                                                                                                (master✱)
Hello World! I have been seen b'11' times.%
```

Tear down 

`docker-compose stop`
