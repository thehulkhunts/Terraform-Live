terraform {
  backend "s3" {
    //before creating ec2 module get bucket name first
    bucket       = "provide-your-bucket-name"
    key          = "compute/dev/terraform.tfstate"
    encrypt      = true
    region       = "ap-south-1"
    use_lockfile = true
  }
}
// create you bucket in s3 and provide bucket name here