module "vpc" {
  source = "git::https://github.com/thehulkhunts/aws-terraform-modules-releaser.git?ref=aws/modules/vpc/v1.1.0"

  vpc_cidr             = var.vpc_cidr
  environment          = var.environment
  public_subnet_cidr   = var.public_subnet_cidrs
  private_subnet_cidr  = var.private_subnet_cidrs
  availability_zone    = var.availability_zones
  tags                 = var.common_tags
}
