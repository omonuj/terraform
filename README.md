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

```bash
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
```

### Run a lesson

```bash
cd 01-terraform-basics
terraform init
terraform plan
terraform apply
terraform destroy   # always clean up
```

---

## Command Reference

**Core workflow**

```bash
terraform init                      # download providers, configure backend
terraform validate                  # check syntax and internal consistency
terraform fmt                       # canonical formatting
terraform plan                      # preview changes
terraform apply                     # execute
terraform destroy                   # tear down
terraform show                      # inspect current state
terraform console                   # interactive expression evaluation
```

**Saved plans**

```bash
terraform plan -out iam.tfplan
terraform apply "iam.tfplan"
```

**Targeting individual resources**

```bash
terraform apply -target="aws_iam_user.my_iam_user"
terraform apply -target=aws_default_vpc.default
terraform apply -target=data.aws_subnet_ids.default_subnets
terraform apply -target=data.aws_ami.aws_linux_2_latest
```

**Passing variables**

```bash
terraform plan -var="iam_user_name_prefix=VALUE_FROM_COMMAND_LINE"
export TF_VAR_iam_user_name_prefix=FROM_ENV_VARIABLE_IAM_PREFIX
```

**Skipping refresh** (faster iteration when you know state is current)

```bash
terraform apply -refresh=false
```

**Workspaces**

```bash
terraform workspace list
terraform workspace new prod-env
terraform workspace select prod-env
terraform workspace show
```

---

## Remote State Setup

`07-backend-state/` uses a partial backend configuration so the bucket details
stay out of version-controlled `.tf` files:

```hcl
terraform {
  backend "s3" {}
}
```

Supply the rest at init time:

```bash
terraform init -backend-config=backend.hcl
```

Where `backend.hcl` points at an S3 bucket for state storage and a DynamoDB
table for locking. The bucket and table must exist before the first `init` —
they are bootstrapped by `07-backend-state/backed-state/`.

---

## Notes

- Resources here are chosen to stay inside or near the AWS free tier
  (`t2.micro`, default VPC), but **running these will incur charges**. Always
  `terraform destroy` when finished.
- Never commit `.pem` keys, `terraform.tfstate`, or credentials. See
  `.gitignore`.
- Regions vary between lessons (`us-east-1` in the earlier ones, `eu-north-1`
  for the backend-state work) — check the provider block before applying.

## License

MIT
