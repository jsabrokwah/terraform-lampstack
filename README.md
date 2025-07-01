# LAMP Stack Todo Application

A simple todo application built with a LAMP stack.

## Features

* Create, Read, Update, and Delete todo items.
* RESTful API endpoints for todo management.
* Frontend interface built with HTML, CSS, and JavaScript.
* Infrastructure as Code using Terraform for AWS deployment.

## Prerequisites

* LAMP stack (Linux, Apache, MySQL, PHP)
* AWS account with appropriate permissions
* Terraform installed locally for infrastructure deployment

## Project Structure

- `src/` - Source code for the application including API and frontend.
- `terraform/` - Terraform configuration files for AWS infrastructure.
- `Lab-Instruction.md` - Instructions for lab setup and usage.

## Setup and Deployment

1. Deploy the application on an AWS EC2 instance with a LAMP stack.
2. Configure the database connection in the PHP files located in `src/api/config/Database.php`.
3. Use Terraform to provision the required AWS infrastructure:
   - Navigate to the `terraform/` directory.
   - Run `terraform init` to initialize.
   - Run `terraform apply` to create resources.
4. Access the application through your EC2 instance's public IP or domain name.

## Usage

- Use the frontend interface to manage todo items.
- Alternatively, use the RESTful API endpoints in `src/api/` for CRUD operations.

