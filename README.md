# AWS Infrastructure with Terraform

This project implements a production-ready AWS infrastructure using Terraform, featuring a secure networking setup with public and private subnets across multiple availability zones.

## Infrastructure Overview

The project creates the following AWS resources:

### Networking (Network/)
- VPC with custom CIDR block
- 2 Public Subnets (across different AZs)
- 2 Private Subnets (across different AZs)
- Internet Gateway for public internet access
- NAT Gateway for private subnet internet access
- Public and Private Route Tables
- Security Groups for controlling inbound/outbound traffic

### Security (Security/)
- AWS Key Pair for EC2 instance access
- AWS Secrets Manager for storing sensitive information
- Security Groups configuration allowing:
  - SSH access (Port 22)
  - HTTP/HTTPS access (Ports 80/443)
  - Application port (3000)

### Compute
- EC2 instances in private subnet
- Ubuntu-based AMI
- Apache2 web server configuration

## Prerequisites

1. AWS CLI installed and configured
2. Terraform v1.0.0 or later
3. Valid AWS credentials with appropriate permissions
4. Git (optional)

## Project Structure
```
├── backend.tf          # Terraform backend configuration
├── dev.tfvars         # Development environment variables
├── ec2.tf             # EC2 instance configuration
├── main.tf            # Main Terraform configuration
├── variables.tf       # Variable declarations
├── Network/           # Network infrastructure
└── Security/          # Security configurations
```

## Usage

1. Clone the repository
2. Initialize Terraform:
   ```
   terraform init
   ```

3. Create a `terraform.tfvars` or use existing `dev.tfvars` with required variables:
   ```hcl
   region              = "your-region"
   VPC_CIDR           = "10.0.0.0/16"
   COMPANY_NAME       = "your-company"
   public_subnet1_cidr = "10.0.1.0/24"
   public_subnet2_cidr = "10.0.2.0/24"
   private_subnet1_cidr = "10.0.3.0/24"
   private_subnet2_cidr = "10.0.4.0/24"
   instance_type      = "t2.micro"
   ```

4. Review the plan:
   ```
   terraform plan -var-file="dev.tfvars"
   ```

5. Apply the configuration:
   ```
   terraform apply -var-file="dev.tfvars"
   ```

## Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| region | AWS Region | string | - |
| VPC_CIDR | VPC CIDR Block | string | - |
| COMPANY_NAME | Company Name for resource tagging | string | - |
| public_subnet1_cidr | Public Subnet 1 CIDR | string | - |
| public_subnet2_cidr | Public Subnet 2 CIDR | string | - |
| private_subnet1_cidr | Private Subnet 1 CIDR | string | - |
| private_subnet2_cidr | Private Subnet 2 CIDR | string | - |
| instance_type | EC2 Instance Type | string | - |

## Security

- All sensitive information is stored in AWS Secrets Manager
- Private subnets are protected from direct internet access
- Security groups follow the principle of least privilege
- SSH access is restricted to specific IP ranges

## Maintenance and Updates

To update the infrastructure:
1. Modify the relevant .tf files
2. Run `terraform plan` to review changes
3. Apply changes with `terraform apply`

To destroy the infrastructure:
```
terraform destroy -var-file="dev.tfvars"
```

## Note
Remember to destroy resources when not in use to avoid unnecessary AWS charges.
