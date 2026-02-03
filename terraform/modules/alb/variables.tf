# modules/alb/variables.tf

variable "alb_name" {}
variable "vpc_id" {}
variable "subnet_ids" {}
variable "target_group_port" {}
variable "target_group_protocol" {}
variable "health_check_path" {}
