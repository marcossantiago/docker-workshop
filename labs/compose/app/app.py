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