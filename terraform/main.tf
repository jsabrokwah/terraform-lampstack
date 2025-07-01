module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones = var.availability_zones
  name_prefix        = var.name_prefix
  public_subnet_ids  = module.public_subnet.public_subnet_ids
}

module "public_subnet" {
  source = "./modules/public_subnet"

  vpc_id             = module.vpc.aws_vpc_id
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones = var.availability_zones
  name_prefix        = var.name_prefix
}

module "private_subnet" {
  source = "./modules/private_subnet"

  vpc_id             = module.vpc.aws_vpc_id
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones = var.availability_zones
  name_prefix        = var.name_prefix
}

module "web_security_group" {
  source = "./modules/web_security_group"

  vpc_id          = module.vpc.aws_vpc_id
  name_prefix     = var.name_prefix
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "web_ec2_instance" {
  source = "./modules/web_ec2_instance"

  ami_id           = var.web_ami_id
  instance_type    = var.web_instance_type
  subnet_id        = module.public_subnet.public_subnet_ids[0]
  key_name         = var.key_name
  security_group_id = module.web_security_group.id
  name_prefix      = var.name_prefix

  app_instance_private_ip = module.app_ec2_instance.private_ip
}

module "app_security_group" {
  source = "./modules/app_security_group"

  vpc_id      = module.vpc.aws_vpc_id
  name_prefix = var.name_prefix
  web_sg_id   = module.web_security_group.id
}

module "app_ec2_instance" {
  source = "./modules/app_ec2_instance"

  ami_id           = var.web_ami_id
  instance_type    = var.web_instance_type
  subnet_id        = module.private_subnet.private_subnet_ids[0]
  key_name         = var.key_name
  security_group_id = module.app_security_group.id
  name_prefix      = var.name_prefix

  db_host          = module.db_ec2_instance.private_ip
  db_root_password = var.db_root_password
}

module "db_security_group" {
  source = "./modules/db_security_group"

  vpc_id      = module.vpc.aws_vpc_id
  name_prefix = var.name_prefix
  app_sg_id   = module.app_security_group.id
}

module "db_ec2_instance" {
  source = "./modules/db_ec2_instance"

  ami_id           = var.web_ami_id
  instance_type    = var.web_instance_type
  subnet_id        = module.private_subnet.private_subnet_ids[0]
  key_name         = var.key_name
  security_group_id = module.db_security_group.id
  name_prefix      = var.name_prefix

  db_root_password = var.db_root_password
}
