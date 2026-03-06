# terraform.tfvars

aws_region            = "us-east-1"
project_name          = "my-project"
vpc_cidr              = "10.0.0.0/16"
public_subnets        = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets       = ["10.0.3.0/24", "10.0.4.0/24"]
instance_count        = 1
instance_type         = "t2.micro"
ami_id                = "ami-0c55b159cbfafe1f0" # us-east-1 Amazon Linux 2 AMI
alb_name              = "my-alb"
target_group_port     = 80
target_group_protocol = "HTTP"
health_check_path     = "/"
repository_name       = "my-ecr-repo"
