# Project Bedrock – Cloud-Native Retail Platform on AWS

## Project Overview

Project Bedrock is a cloud-native retail platform deployed on AWS using Infrastructure as Code (Terraform), Kubernetes (Amazon EKS), serverless integrations, observability tooling, and CI/CD automation.

The project demonstrates the deployment and management of a scalable microservices architecture using modern DevOps and Cloud Engineering practices.

---

# Architecture Summary

The platform consists of:

* Amazon EKS cluster hosting retail microservices
* Application Load Balancer (ALB) ingress controller
* Amazon RDS databases (MySQL and PostgreSQL)
* Amazon DynamoDB for cart persistence
* AWS Lambda for serverless processing
* Amazon S3 event-driven triggers
* Amazon CloudWatch observability integration
* GitHub Actions CI/CD pipeline
* Terraform Infrastructure as Code

---

# Architecture Diagram

The complete architecture diagram is available in:

```text
/diagrams/project-bedrock-architecture.png
```

---

# Technologies Used

| Category                | Tools / Services                          |
| ----------------------- | ----------------------------------------- |
| Cloud Provider          | AWS                                       |
| Infrastructure as Code  | Terraform                                 |
| Container Orchestration | Amazon EKS                                |
| Container Runtime       | Kubernetes                                |
| Databases               | Amazon RDS (MySQL & PostgreSQL), DynamoDB |
| Serverless              | AWS Lambda                                |
| Storage                 | Amazon S3                                 |
| Observability           | Amazon CloudWatch                         |
| CI/CD                   | GitHub Actions                            |
| Ingress                 | AWS Load Balancer Controller              |
| Package Management      | Helm                                      |
| Version Control         | Git & GitHub                              |

---

# Project Structure

```text
project-bedrock/
├── .github/workflows/
├── alb-controller/
├── diagrams/
├── evidence/
├── helm/
├── kubernetes/
├── lambda/
├── retail-store-sample-app/
├── terraform/
└── grading.json
```

---

# Infrastructure Provisioning

Infrastructure was provisioned using Terraform.

Resources created include:

* VPC networking resources
* Amazon EKS cluster
* Node groups
* IAM roles and policies
* RDS MySQL database
* RDS PostgreSQL database
* DynamoDB table
* S3 backend for Terraform remote state
* CloudWatch observability components

Terraform state was configured using a remote S3 backend.

---

# Kubernetes Deployment

Retail microservices were deployed to Amazon EKS using Kubernetes manifests and Helm.

Services deployed:

* carts
* catalog
* orders
* nginx ingress service

Ingress routing was configured using the AWS Load Balancer Controller.

---

# Databases

## Amazon RDS

Two RDS databases were provisioned:

* MySQL database for catalog service
* PostgreSQL database for orders service

## Amazon DynamoDB

A DynamoDB table was created for cart persistence with a Global Secondary Index:

```text
idx_global_customerId
```

---

# CI/CD Pipeline

GitHub Actions was configured for Terraform CI/CD automation.

The workflow performs:

* Terraform initialization
* Terraform format validation
* Terraform validation
* Terraform apply

Secrets were securely managed using GitHub Actions Secrets.

Workflow file:

```text
.github/workflows/terraform.yml
```

---

# Observability & Monitoring

Amazon CloudWatch observability was enabled for the EKS cluster.

The following components were deployed:

* CloudWatch Agent
* Fluent Bit
* Container Insights

Lambda execution logs were also integrated into CloudWatch Logs.

---

# Serverless Integration

An AWS Lambda function was created to process S3 object upload events.

Flow:

```text
Amazon S3 → Lambda Trigger → CloudWatch Logs
```

---

# IAM & Security

The project includes:

* IAM roles and policies
* Kubernetes RBAC
* EKS aws-auth configuration
* Read-only IAM user access
* Secure GitHub Actions secret management

---

# Evidence Collected

Project evidence screenshots were collected for:

* Terraform provisioning
* Database creation
* Kubernetes deployments
* EKS cluster status
* CloudWatch observability
* Lambda deployment
* CI/CD workflow execution

Evidence is stored under:

```text
/evidence/
```

---

# Deployment Steps

## Clone Repository

```bash
git clone https://github.com/BetheeLiz/project-bedrock.git
cd project-bedrock
```

## Initialize Terraform

```bash
cd terraform
terraform init
```

## Apply Infrastructure

```bash
terraform apply
```

## Configure kubectl

```bash
aws eks update-kubeconfig --region us-east-1 --name project-bedrock-cluster
```

## Deploy Kubernetes Resources

```bash
kubectl apply -f kubernetes/
```

---

# Cleanup

To avoid unnecessary AWS charges:

## Delete Kubernetes Resources

```bash
kubectl delete -f kubernetes/
```

## Destroy Terraform Infrastructure

```bash
cd terraform
terraform destroy
```

---

# Learning Outcomes

This project demonstrates practical skills in:

* AWS cloud infrastructure
* Kubernetes orchestration
* Infrastructure as Code
* CI/CD automation
* Observability and monitoring
* Serverless architectures
* Cloud security and IAM
* GitHub Actions automation

---

# Repository

GitHub Repository:

```text
https://github.com/BetheeLiz/project-bedrock
```

---

# Author

Elizabeth Thomas

Cloud Engineering Project – Project Bedrock
