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

## 🏗️ Project Reference Architecture
The system follows a **pull-based architecture** where Prometheus acts as the central aggregator.



```text
       +---------------------------------------+
       |           Prometheus Server           |
       |       (Metrics Scraper & Storage)     |
       +------------------+--------------------+
                          ^
                          | (Scrape HTTP /metrics)
        __________________|__________________
       |                  |                  |
+------v-------+  +-------v-------+  +-------v-------+
|  Python App  |  |    cAdvisor   |  | Docker Engine |
| (Custom Ind.)|  | (Cont. Stats) |  | (Daemon Ind.) |
+--------------+  +---------------+  +---------------+
```

---

📂 Project Structure
```text
docker-prometheus-cadvisor-python-app/
│
├── architecture/             # 🏗️ System Design Documentation
│   └── architecture_view.md
│
├── app/
│   ├── app.py                # Flask application with Prometheus metrics
│   └── Dockerfile            # Container image definition
│
├── scripts/
│   ├── install_docker.sh     # Automated Docker installation
│   └── setup_cadvisor.sh     # cAdvisor container deployment
│
├── prometheus/
│   └── prometheus.yml        # Prometheus scrape configuration
│
├── screenshots/              # 📸 Step-by-step execution screenshots
│
└── README.md
```

---


⚙️ Technologies Used
```text
Component,Technology
Containerization,Docker
Monitoring,Prometheus
Container Metrics,cAdvisor
Application,Python (Flask)
Metrics Client,prometheus_client
OS,Ubuntu Linux
```


---

🚀 Deployment Guide
1️⃣ Install Docker
Run the automation script:
```bash
chmod +x scripts/install_docker.sh
./scripts/install_docker.sh
```
⚠️ Note: Logout and login again to apply Docker group permissions.


2️⃣ Run cAdvisor
Deploy cAdvisor to collect container metrics:
```bash
chmod +x scripts/setup_cadvisor.sh
./scripts/setup_cadvisor.sh
```
UI: http://<NODE-IP>:8080


3️⃣ Build & Run the Python Application
```bash
cd app
docker build -t python-app .
docker run -d -p 5000:5000 --name python-app
```
Metrics: http://<NODE-IP>:5000/metrics

4️⃣ Configure Prometheus
Add targets to prometheus.yml:
```bash
- job_name: "cadvisor-node"
  static_configs:
    - targets: ["<NODE-IP>:8080"]

- job_name: "python-app"
  static_configs:
    - targets: ["<NODE-IP>:5000"]
```


---


📊 Metrics Verification & Screenshots
For a full visual guide of the implementation steps, please refer to the screenshots/ directory. It includes:

✅ Target Connectivity: Confirmation of UP status for all services.

✅ Custom Metrics: Real-time tracking of app_total_requests.

✅ Resource Usage: Monitoring of CPU/Memory via cAdvisor.

---


👨‍💻 Author
Mohannad Faisal DevOps Engineer




