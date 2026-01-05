FROM python:3.8-slim
WORKDIR /app
COPY . /app
RUN pip install flask && pip install prometheus_client && pip install prometheus-flask-exporter
EXPOSE 5000
CMD ["python", "app.py"]
