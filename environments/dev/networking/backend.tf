terraform {
  backend "s3" {
    bucket = "provide-your-bucket-name"
    key    = "networking/dev/terraform.tfstate"
    encrypt = true
    region = "ap-south-1"
    use_lockfile = true
  }
}
// create bucket in s3, and provide bucket name here before applying