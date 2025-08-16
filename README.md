# Custom NGINX Web App Kubernetes Deployment

This project demonstrates how to deploy a custom NGINX web application to a Kubernetes cluster using Docker, Helm, Terraform, and GitHub Actions.

## Features

- Custom NGINX Docker image serving a custom `index.html` page  
- Helm chart to package and deploy the app to Kubernetes  
- Terraform code to automate Helm deployment  
- GitHub Actions workflow to build Docker image, push to Docker Hub, and deploy to Kubernetes cluster on every push  

## Prerequisites

- Docker installed and running  
- Kubernetes cluster available (e.g., Minikube locally)  
- Helm installed  
- Terraform installed   
- Docker Hub account for image push  
- GitHub repository with secrets set: `DOCKER_USERNAME`, `DOCKER_PASSWORD`

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

## Possible Improvements

In the future, the Helm chart could be replaced with Kustomize for simpler and more native Kubernetes configuration management for the following reasons:
- Kustomize is built into kubectl (no separate install required).
- Easier to manage overlays for different environments.
- Reduces complexity for small-scale deployments.
