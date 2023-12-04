resource "aws_security_group" "vpc_sgs" {
  name = var.sg_name

  dynamic "ingress" {
    for_each = var.ing_sg_rules
    content {
      description = ingress.value["ing_description"]
      from_port   = ingress.value["ing_from_port"]
      to_port     = ingress.value["ing_to_port"]
      protocol    = ingress.value["ing_protocol"]
      cidr_blocks = ingress.value["ing_cidr_blocks"]
    }
  }

  dynamic "egress" {
    for_each = var.eg_sg_rules
    content {
      description = egress.value["eg_description"]
      from_port   = egress.value["eg_from_port"]
      to_port     = egress.value["eg_to_port"]
      protocol    = egress.value["eg_protocol"]
      cidr_blocks = egress.value["eg_cidr_blocks"]
    }
  }
}
