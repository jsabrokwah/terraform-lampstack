## **Exercise: Provision a Three-Tier LAMP Stack Using Terraform**

### **Objective**

Create Terraform IaC scripts to provision a basic three-tier LAMP application on a cloud provider (e.g., AWS). The stack includes:

1. **Web Tier**: Apache + PHP
2. **Application Tier**: PHP Logic
3. **Database Tier**: MySQL

---

### **Pre-requisites**

* Terraform installed (**v1.x** recommended)
* An AWS account (or equivalent cloud provider)
* Basic knowledge of Terraform and LAMP stack
* AWS CLI configured (if using AWS)

---

### **Architecture Overview**

* VPC with public and private subnets
* Web Tier in **public subnet** (EC2 instance with Apache + PHP)
* App Tier in **private subnet** (optional extra EC2 for PHP logic)
* DB Tier in **private subnet** (MySQL on EC2)
* **Security Groups** to control access
* **User Data Scripts** for LAMP setup

> **NOTE**: Make sure you use a **modular structure** in your scripts and ensure you **automate the application deployment**.

