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
    security_groups             = ["bastion-sg"]
  }
  jenkins = {
    instance_type               = "t3.micro"
    key_name                    = "mykey"
    subnet_key                  = "public-b"
    volume_size                 = 20
    volume_type                 = "gp3"
    associate_public_ip_address = true
    security_groups             = ["web-sg", "app-sg"]
    //if you are creating any private instance set to  "associate_public_ip_address = false"
  }
}

security_groups = {

  web-sg = {
    description = "Web Security Group"
    ingress_rules = [
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        description = "HTTP"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        description = "HTTPS"

        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        description = "All Outbound"

        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    tags = {
      Application = "frontend"
    }
  }
  //application security_group
  app-sg = {
    description = "Application Security Group"
    ingress_rules = [
      {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        description = "Spring Boot"

        cidr_blocks = ["10.0.0.0/16"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        description = "All"

        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    tags = {
      Application = "backend"
    }
  }
  //bastion security group
  bastion-sg = {
    description = "Bastion"
    ingress_rules = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        description = "SSH"

        cidr_blocks = ["10.0.0.0/16"]
      }
    ]
    egress_rules = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        description = "All"

        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    tags = {
      Application = "bastion"
    }
  }
}