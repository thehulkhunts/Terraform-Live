module "ec2" {
  source      = "git::https://github.com/thehulkhunts/aws-terraform-modules-releaser.git?ref=aws/modules/compute/ec2/v1.1.0"
  environment = var.environment

  ec2_instances = {
    for name, instance in var.ec2_instances :
    name => {
      instance_type               = instance.instance_type
      key_name                    = instance.key_name
      subnet_id                   = local.subnet_lookup[instance.subnet_key]
      volume_size                 = instance.volume_size
      volume_type                 = instance.volume_type
      associate_public_ip_address = instance.associate_public_ip_address

      security_group_ids = [
        for sg in instance.security_groups :
        module.vpc_security_groups.security_group_ids[sg]
      ]

    }
  }

}

module "vpc_security_groups" {
  source          = "git::https://github.com/thehulkhunts/aws-terraform-modules-releaser.git?ref=aws/modules/networking/security_groups/v1.2.0"
  security_groups = var.security_groups
  vpc_id          = data.terraform_remote_state.networking.outputs.vpc_id
}