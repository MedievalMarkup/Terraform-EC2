//SecurityGroups

variable "sg_name" {
  description = "Security Group Name"
  type = string
}

variable "ing_sg_rules" {
  type = list(object({
    ing_description = string
    ing_from_port   = number
    ing_to_port     = number
    ing_protocol    = string
    ing_cidr_blocks = list(string)
    # ing_ipv6_cidr_blocks = list(string)
    #ing_sg_tags        = string
  }))
}

variable "eg_sg_rules" {
  type = list(object({
    eg_description = string
    eg_from_port   = number
    eg_to_port     = number
    eg_protocol    = string
    eg_cidr_blocks = list(string)
    # eg_ipv6_cidr_blocks = list(string)
    #eg_sg_tags        = string
  }))
}

# variable "sg_name" {
#   description = "Security Group Name"
#   type = string
# }

# variable "sg_description" {
#   description = "Security Group description"
#   type = string
# }

# variable "web_sg_name" {
#   description = "Security Group Name"
#   type = string
# }

# variable "web_sg_description" {
#   description = "Security Group description"
#   type = string
# }

# variable "vpc_id" {
#   description = "VPC ID"
#   type = string
# }

# variable "ing_description" {
#   description = "Security Group description"
#   type = string
# }

# variable "ing_from_port" {
#   description = "Security Group description"
#   type = number
# }

# variable "ing_to_port" {
#   description = "Security Group description"
#   type = number
# }

# variable "ing_cidr_block" {
#   description = "Security Group description"
#   type = list(string)
# }

# variable "ing_protocol" {
#   description = "Security Group description"
#   type = string
# }

# variable "eg_cidr_block" {
#   description = "cidr"
#   type = list(string)
# }

# variable "eg_from_port" {
#   description = "from all sources"
#   type = number
# }

# variable "eg_to_port" {
#   description = "from all sources"
#   type = number
# }

# variable "eg_protocol" {
#   description = "-1 means all protocols"
#   type = number
# }

# variable "tags" {
#   description = "sg tags"
#   type = string
# }

# variable "web_ing_description" {
#   description = "Security Group description"
#   type = string
# }

# variable "web_ing_from_port" {
#   description = "Security Group description"
#   type = number
# }

# variable "web_ing_to_port" {
#   description = "Security Group description"
#   type = number
# }

# variable "web_ing_cidr_block" {
#   description = "Security Group description"
#   type = list(string)
# }

# variable "web_ing_protocol" {
#   description = "Security Group description"
#   type = string
# }

# variable "web_tag" {
#   description = "sg tags"
#   type = string
# }

# variable "ssh_tag" {
#   description = "sg tags"
#   type = string
# }
