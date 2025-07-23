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


## Terraform Setup and Commands

### 🔧 Installation
```bash

brew install terraform
terraform --version
terraform version
terraform init
export AWS_ACCESS_KEY_ID=*******
export AWS_SECRET_ACCESS_KEY=*********
terraform plan
terraform console
terraform apply -refresh=false
terraform plan -out iam.tfplan
terraform apply "iam.tfplan"
terraform apply -target="aws_iam_user.my_iam_user"
terraform destroy
terraform validate
terraform fmt
terraform show
export TF_VAR_iam_user_name_prefix = FROM_ENV_VARIABLE_IAM_PREFIX
export TF_VAR_iam_user_name_prefix=FROM_ENV_VARIABLE_IAM_PREFIX
terraform plan -refresh=false -var="iam_user_name_prefix=VALUE_FROM_COMMAND_LINE"
terraform apply -target=aws_default_vpc.default
terraform apply -target=data.aws_subnet_ids.default_subnets
terraform apply -target=data.aws_ami_ids.aws_linux_2_latest_ids
terraform apply -target=data.aws_ami.aws_linux_2_latest
terraform workspace show
terraform workspace new prod-env
terraform workspace select default
terraform workspace list
terraform workspace select prod-env
```


## ⚠️ Disclaimer

This repo is for educational and development use only. Be cautious with sensitive files (e.g., `.pem` keys, AWS credentials).

## 📄 License

MIT License

