from flask import Flask, jsonify
from prometheus_client import Counter, generate_latest
from flask import Response

app = Flask(__name__)

total_requests_counter = Counter('app_total_requests', 'Total number of requests to the application')

@app.route('/')
def hello():
    total_requests_counter.inc()
    return 'Welcome to node-01: Monitoring System is Live!'

@app.route('/metrics')
def metrics():
    return Response(generate_latest(), content_type='text/plain')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
