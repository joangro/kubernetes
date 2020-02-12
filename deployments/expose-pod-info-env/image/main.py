from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def helloWorld():
    pod_id = os.environ.get('MY_POD_NAME', '')
    return "Hello world, from pod {}!".format(pod_id)

if __name__=='__main__':
    app.run('0.0.0.0', port=8080, debug=True)
