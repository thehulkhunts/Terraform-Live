environment = "dev"

aws_region = "ap-south-1"

ec2_instances = {
  bastion = {
    instance_type               = "t3.micro"
    key_name                    = "mykey"
    subnet_key                  = "public-a"
    volume_size                 = 20
    volume_type                 = "gp3"
    associate_public_ip_address = true
  }
  jenkins = {
    instance_type               = "t3.micro"
    key_name                    = "mykey"
    subnet_key                  = "public-b"
    volume_size                 = 20
    volume_type                 = "gp3"
    associate_public_ip_address = true
    //if you are creating any private instance set to  "associate_public_ip_address = false"
  }
}