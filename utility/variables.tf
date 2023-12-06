variable "chk_ec2_loc" {
  description = "location"
  type        = list(string)
  default     = ["us-west-2b"]
}

variable "loc_type" {
  description = "location type"
  type        = string
  default     = "availability-zone"  
}

variable "aws_ec2_instance_type" {
  description = "AWS EC2 Instance Type"
  type = list(string)
  default = ["t3.micro"]
}

variable "aws_region" {
  description = "AWS EC2 region"
  type = string
  default = "us-west-2"
}
