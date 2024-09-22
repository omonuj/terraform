# Terraform on AWS — A Progressive Infrastructure-as-Code Workbook

A hands-on Terraform repository built up module by module, starting from a bare
provider block and ending with remote state, reusable modules, and load-balanced
EC2 fleets. Each numbered directory is a self-contained lesson that introduces
exactly one new concept on top of the previous one.

Everything here targets AWS and is written against the `hashicorp/aws` provider.

---

## Learning Path

| Directory | Concept | What it builds |
|---|---|---|
| `01-terraform-basics/` | Providers, resources, outputs | A single IAM user, exported via `output` |
| `02-terraform-basics/` | Variables and `.tfvars` | Parameterised IAM user naming |
| `03-list-and-sets/` | `count`, lists, sets | Multiple IAM users from a list |
| `04-maps/` | Maps and lookups | Per-user configuration driven by a map |
| `05-ec2-instances/` | Data sources, security groups | EC2 instance with dynamic AMI lookup and SSH/HTTP access |
| `06-ec2-with-elb/` | Locals, ELB, multi-AZ | EC2 behind a classic Elastic Load Balancer |
| `07-backend-state/` | Remote state, workspaces | S3 backend with DynamoDB state locking |

The `backup/` directory holds earlier iterations of the same exercises, plus two
extras that were never promoted to the top level:

- `backup/08-modules/` — a reusable `users` module consumed by separate `dev/`
  and `qa/` root configurations
- `backup/09-multiple-ec2-instances/` — `count`-based EC2 scaling across the
  default VPC's subnets

---

## Concepts Covered

**Language fundamentals**
- Providers, resources, and outputs
- Input variables via `.tfvars`, `-var`, and `TF_VAR_*` environment variables
- Lists, sets, and maps; `count` and `for_each`
- `locals`, `zipmap`, and `tolist` for shaping data
- Data sources (`aws_ami`, `aws_subnet_ids`, `aws_default_vpc`)

**AWS resources**
- IAM users
- Default VPC and subnet discovery
- Security groups with ingress/egress rules
- EC2 instances with key pairs and shell provisioning
- Classic Elastic Load Balancer

**State management**
- S3 remote backend with `encrypt = true`
- DynamoDB table for state locking
- Partial backend configuration via `backend.hcl`
- Workspaces for environment separation (`default`, `prod-env`)

**Module design**
- Extracting a root config into a reusable module
- Consuming one module from multiple environments with different inputs

---

## Getting Started

### Install

```bash
brew install terraform
terraform version
```

### Authenticate

Export credentials rather than committing them:
