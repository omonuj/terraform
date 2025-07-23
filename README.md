# Terraform DevOps Projects

This repository contains a set of structured Terraform modules and configurations used to automate infrastructure deployment on AWS. It covers a range of use cases and best practices including:

- VPC and Subnet creation
- Security Groups and IAM roles
- EC2 instances with SSH and web server provisioning
- Load balancers (ELB)
- Usage of variables, maps, lists, and local values
- Dynamic blocks and multiple instances via `for_each`
- Clean module design and reusable infrastructure

These projects are designed for learning, experimentation, and real-world DevOps infrastructure as code (IaC) workflows.

## 💼 Technologies Used

- Terraform
- AWS (EC2, ELB, VPC, IAM)
- Shell Provisioners
- Git

## 📂 Folder Structure

Each folder represents a focused Terraform concept or use case:

- `01-terraform-basics/` – Initial setup and provider configuration
- `02-terraform-basics/` – Resource creation with outputs
- `03-list-and-sets/` – Use of lists and dynamic resource creation
- `04-maps/` – Use of maps for parameterizing resources
- `05-ec2-instances/` – Launching EC2 with key pairs and SGs
- `06-ec2-with-elb/` – EC2 deployment with Elastic Load Balancer

## ⚠️ Disclaimer

This repo is for educational and development use only. Be cautious with sensitive files (e.g., `.pem` keys, AWS credentials).

## 📄 License

MIT License

