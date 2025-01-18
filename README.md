# AWS VPC Infrastructure with Egress-Only Internet Gateway (IPv4 & IPv6 Support)

This Terraform project provisions a highly resilient and secure AWS Virtual Private Cloud (VPC) infrastructure with dual-stack support for IPv4 and IPv6. To optimize cost-efficiency without compromising functionality, the solution replaces the traditional NAT Gateway (associated with hourly pricing and data transfer charges) with an Egress-Only Internet Gateway, which is free of hourly costs but incurs data transfer fees. This approach enables secure and cost-effective outbound internet connectivity for resources within private subnets.

The infrastructure design emphasizes high availability, robust security, and scalability, adhering to AWS best practices for VPC architecture. Key features include private and public subnets distributed across multiple Availability Zones, improved traffic flow management, and minimized external exposure to enhance security.

This solution is tailored to meet the demands of modern cloud-native applications, offering a secure, scalable, and flexible VPC setup. It facilitates optimized internal traffic management while maintaining a strong focus on operational efficiency and reduced costs.

## Architecture Overview

The infrastructure includes:
- VPC with IPv4 and IPv6 CIDR blocks
- Public and Private Subnets across two availability zones with IPv6 support
- Internet Gateway for public subnets
- Egress-Only Internet Gateway for private subnets IPv6 outbound traffic
- Route tables for both public and private subnets

### Network Layout
- VPC CIDR: 10.0.0.0/16
- Public Subnets:
  - **region**-a: 10.0.1.0/24 (with IPv6)
  - **region**-c: 10.0.2.0/24 (with IPv6)
- Private Subnets:
  - **region**-a: 10.0.10.0/24 (with IPv6)
  - **region**-c: 10.0.11.0/24 (with IPv6)

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
Creates public and private subnets across two availability zones with appropriate CIDR blocks, IPv6 support, and tags. All subnets are configured with automatic IPv6 address assignment.

### IGW Module
Sets up the Internet Gateway and configures route tables for public subnets, enabling both IPv4 and IPv6 internet access.

### EIGW Module
Configures the Egress-Only Internet Gateway and route tables for private subnets with IPv6 support, allowing outbound-only IPv6 internet access.

## Usage

1. Clone the repository:
```bash
git clone https://github.com/satyapraven/VPC-with-Egress-only-IGW.git
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
- All subnets are configured with IPv6 support
- Public subnets have auto-assign public IPv4 enabled
- Private subnets use Egress-Only Internet Gateway for outbound IPv6 traffic only

## Network Configuration

### IPv6 Support
- VPC is configured with an Amazon-provided IPv6 CIDR block
- All subnets (public and private) are configured with IPv6 CIDR blocks
- Public subnets allow both IPv4 and IPv6 internet access
- Private subnets allow outbound-only IPv6 internet access through EIGW

### Internet Access
- Public Subnets:
  - Outbound/Inbound IPv4 via Internet Gateway
  - Outbound/Inbound IPv6 via Internet Gateway
- Private Subnets:
  - Outbound-only IPv6 via Egress-Only Internet Gateway
  - No direct IPv4 internet access

## Security Considerations

- Private subnets are isolated from direct internet access
- Public subnets are only used for resources that require direct internet access
- Network ACLs and Security Groups should be configured based on specific requirements
- IPv6 traffic from private subnets is outbound-only through EIGW

## Cleanup

To destroy the infrastructure:
```bash
terraform destroy -var="aws_region=us-west-2"  # Use the same region as deployment
```

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
