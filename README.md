# Fullstack Demo 🚀

This is a simple **Fullstack project** built with:  
- **Frontend:** Vue.js (Nuxt) served with **NGINX** inside Docker  
- **Backend:** Python (Flask) running inside Docker  
- **Containerization & Deployment:** Docker & Docker Compose / Helm  

---

## 📌 Features
- Input a number in the frontend and send it to the backend.  
- Backend computes the square (number²) and returns the result.  
- Frontend displays the computed result dynamically.  
- Containers are isolated:  
  - `nginx_vue` → frontend  
  - `flask_backend` → backend  

---
## Prerequisites

- Docker installed and running  
- Kubernetes cluster available (e.g., Minikube locally)  
- Helm installed  
- Terraform installed   
- Docker Hub account for image push  
- GitHub repository with secrets set: `DOCKER_USERNAME`, `DOCKER_PASSWORD`

## 🐳 Docker Setup

### Build Images
review the README files in each docker folder (backend_docker, frontend_docker)

### Run Containers
```bash
# Run backend
docker run -d -p 5000:5000 hassanalnahhaas/fullstack_demo_backend:latest

# Run frontend
docker run -d -p 8080:80 hassanalnahhaas/fullstack_nginx_vue:latest
```

---

## 🛠 Project Structure
```
full_stack/
│
├── backend/              # Flask backend source code
│   ├── app.py
│   └── requirements.txt
│
├── frontend/             # Vue.js (Nuxt) frontend source code
│   └── ...
│
├── backend_docker/       # Dockerfile + infra for backend
│   └── Dockerfile
│
├── frontend_docker/      # Dockerfile + infra for frontend
│   └── Dockerfile
│
├── .gitignore
└── README.md
```

---


## Why Minikube was chosen
- Minikube is a lightweight tool for running a Kubernetes cluster, easy to install, and specifically designed for local development and testing.

## Deploying the Helm Chart with Terraform

1. Start Minikube locally:  
   ```bash
   minikube start
   ```

2. Build and push the Docker image:  
   ```bash
   docker build -t alnahhaas/sonnen_1st:latest .
   docker login
   docker push alnahhaas/sonnen_1st:latest

   ```

3. Apply the Terraform configuration:  
   ```bash
   terraform init   # Initialize the Terraform tool
   terraform plan   # Review the configuration before deployment
   terraform apply  # Apply and deploy the configurations
   ```

4. forward the service port and access it locally:  
   ```bash
   kubectl port-forward svc/sonnen1st 8080:80 #Then open http://localhost:8080 in your browser.
   ```
