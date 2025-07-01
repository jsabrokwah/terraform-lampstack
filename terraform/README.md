# Terraform Infrastructure

This directory contains Terraform configuration files to provision AWS infrastructure for the LAMP stack todo application.

## Structure

- `main.tf` - Main Terraform configuration file.
- `variables.tf` - Input variables for the Terraform modules.
- `output.tf` - Outputs from the Terraform deployment.
- `modules/` - Reusable Terraform modules for different components:
  - `vpc/` - Virtual Private Cloud setup.
  - `app_ec2_instance/` - EC2 instance for the application server.
  - `db_ec2_instance/` - EC2 instance for the database server.
  - `web_ec2_instance/` - EC2 instance for the web server.
  - Security groups and subnet modules.

## Prerequisites

- AWS account with appropriate permissions.
- Terraform installed locally.

## Usage

1. Navigate to the `terraform/` directory.
2. Run `terraform init` to initialize the working directory.
3. Run `terraform plan` to preview the changes.
4. Run `terraform apply` to provision the infrastructure.
5. Use `terraform destroy` to tear down the infrastructure when no longer needed.

## Notes

- Ensure AWS credentials are configured in your environment.
- Review and customize variables in `variables.tf` as needed.
- The infrastructure provisions EC2 instances configured for the LAMP stack application.
