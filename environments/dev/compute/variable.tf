variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "environment" {
  type = string
}

variable "ec2_instances" {
  description = "Map of EC2 instances to create, keyed by a friendly name"
  type = map(object({
    instance_type               = string
    key_name                    = string
    subnet_key                  = string
    volume_size                 = number
    volume_type                 = string
    associate_public_ip_address = bool
  }))
}
