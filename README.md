# AWS VPC Infrastructure with Terraform

This Terraform project creates a fully configured AWS VPC infrastructure optimized for EKS (Elastic Kubernetes Service) with both IPv4 and IPv6 support.

## Architecture Overview

The infrastructure includes:
- VPC with IPv4 and IPv6 CIDR blocks
- Public and Private Subnets across two availability zones
- Internet Gateway for public subnets
- Egress-Only Internet Gateway for private subnets
- Route tables for both public and private subnets

### Network Layout
- VPC CIDR: 10.0.0.0/16
- Public Subnets:
  - <region>a: 10.0.1.0/24
  - <region>c: 10.0.2.0/24
- Private Subnets:
  - <region>a: 10.0.10.0/24
  - <region>c: 10.0.11.0/24

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0.0
- AWS account with necessary permissions

## Module Structure

```
.
├── main.tf
├── variables.tf
├── Modules
│   ├── VPC
│   │   ├── main.tf
│   │   └── outputs.tf
│   ├── subnets
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── IGW
│   │   ├── main.tf
│   │   └── variables.tf
│   └── EIGW
│       ├── main.tf
│       └── variables.tf
```

## Modules Description

### VPC Module
Creates the main VPC with IPv4 and IPv6 support, DNS settings, and appropriate tags for EKS.

### Subnets Module
Creates public and private subnets across two availability zones with appropriate CIDR blocks and tags.

### IGW Module
Sets up the Internet Gateway and configures route tables for public subnets.

### EIGW Module
Configures the Egress-Only Internet Gateway and route tables for private subnets with IPv6 support.

## Usage

1. Clone the repository:
```bash
git clone <repository-url>
```

2. Initialize Terraform:
```bash
terraform init
```

3. Review the planned changes:
```bash
terraform plan -var="aws_region=us-west-2"  # Replace with your desired region
```

4. Apply the configuration:
```bash
terraform apply -var="aws_region=us-west-2"  # Replace with your desired region
```

## Important Notes

- The infrastructure can be deployed in any AWS region (default: ap-northeast-1)
- All resources are tagged appropriately for EKS integration
- Private subnets use an Egress-Only Internet Gateway for IPv6 outbound connectivity
- Public subnets have auto-assign public IPv4 enabled

## Security Considerations

- Private subnets are isolated from direct internet access
- Public subnets are only used for resources that require direct internet access
- Network ACLs and Security Groups should be configured based on specific requirements

## Cleanup

To destroy the infrastructure:
```bash
terraform destroy -var="aws_region=us-west-2"  # Use the same region as deployment
```

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.