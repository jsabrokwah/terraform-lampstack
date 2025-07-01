# LAMP Stack Todo Application

A simple todo application built with a LAMP stack. This application allows users to create, read, update, and delete (CRUD) todo items. The application uses a MySQL database to store todo items and a PHP backend to handle requests.

The infrastructure was automatically provisioned using Terraform and AWS. The application is deployed on an EC2 instance running Amazon Linux 2.

## Usage

- Use the frontend interface ([click here](http://3.72.64.36/)) to manage todo items.

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

