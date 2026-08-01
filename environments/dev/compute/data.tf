
//this data source block will read the terraform statefile and load networking outputs 
// if any resources like "ec2" wants to assume "subnet_ids" "vpc_id" you can load it from data source block

data "terraform_remote_state" "networking" {
  backend = "s3"

  config = {
    bucket = "provide-your-bucket-name"
    key    = "networking/dev/terraform.tfstate"
    region = "ap-south-1"
  }
}

//creates locals for subnets to assume ec2_instances

locals {
  subnet_lookup = {
    public-a = data.terraform_remote_state.networking.outputs.public_subnet_ids[0]
    public-b = data.terraform_remote_state.networking.outputs.public_subnet_ids[1]

    private-a = data.terraform_remote_state.networking.outputs.private_subnet_ids[0]
    private-b = data.terraform_remote_state.networking.outputs.private_subnet_ids[1]
  }
}