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