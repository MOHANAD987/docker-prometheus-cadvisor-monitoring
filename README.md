# 🚀 Docker Monitoring Stack with Prometheus, cAdvisor & Python Metrics

<p align="center">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white" />
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/Ubuntu-E9433F?style=for-the-badge&logo=ubuntu&logoColor=white" />
</p>

## 📌 Project Summary
This project demonstrates a production-oriented monitoring setup for Docker-based environments using **Prometheus** and **cAdvisor**, along with a custom **Python Flask** application exposing application-level metrics.

The goal of this project is to showcase real-world DevOps monitoring practices, including:
* ✅ **Container-level metrics** (via cAdvisor).
* ✅ **Application-level metrics** (via Flask & Prometheus Client).
* ✅ **Metrics scraping** and visualization readiness.
* ✅ **Clean project structure** and automation scripts.

---

## 🏗️ Architecture Overview



```text
+-------------------+       +---------------------+
|   Python App      | <---> |   Prometheus Server |
|  (Flask + Metrics)|       |  Metrics Collector |
+-------------------+       +---------------------+
          |
          v
+-------------------+
|    cAdvisor       |
| Docker Metrics    |
+-------------------+
          |
          v
+-------------------+
|   Docker Engine   |
+-------------------+




📂 Project Structure

docker-prometheus-cadvisor-python-app/
│
├── app/
│   ├── app.py                # Flask application with Prometheus metrics
│   ├── Dockerfile            # Container image definition
│
│
├── scripts/
│   ├── install_docker.sh     # Automated Docker installation
│   └── setup_cadvisor.sh     # cAdvisor container deployment
│
├── prometheus/
│   └── prometheus.yml        # Prometheus scrape configuration
│
├── README.md




⚙️ Technologies Used
Component,Technology
Containerization,Docker
Monitoring,Prometheus
Container Metrics,cAdvisor
Application,Python (Flask)
Metrics Client,prometheus_client
OS,Ubuntu Linux



🚀 Deployment Guide
1️⃣ Install Docker
Run the automation script to install Docker and configure user permissions:
chmod +x scripts/install_docker.sh
./scripts/install_docker.sh

⚠️ Note: Logout and login again to apply Docker group permissions.



2️⃣ Run cAdvisor
Deploy cAdvisor to collect Docker container metrics:
chmod +x scripts/setup_cadvisor.sh
./scripts/setup_cadvisor.sh

cAdvisor UI: http://<NODE-IP>:8080




3️⃣ Build & Run the Python Application
Navigate to the app directory and containerize the Flask application:
cd app
docker build -t python-app .
docker run -d -p 5000:5000 --name python-app

Test App: http://<NODE-IP>:5000

Metrics Endpoint: http://<NODE-IP>:5000/metrics




4️⃣ Configure Prometheus
Add the new targets to your prometheus.yml:
- job_name: "cadvisor-node"
  static_configs:
    - targets: ["<NODE-IP>:8080"]

- job_name: "python-app"
  static_configs:
    - targets: ["<NODE-IP>:5000"]


Restart Prometheus:
sudo systemctl restart prometheus



📊 Metrics Verification
Open your Prometheus Web UI and execute the following query to see the custom metric:
app_total_requests

Each request to the / endpoint increases this counter.





👨‍💻 Author
Mohannad Faisal  DevOps Engineer
