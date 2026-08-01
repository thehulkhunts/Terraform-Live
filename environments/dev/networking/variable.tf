variable "vpc_cidr" {
  type = string
  description = "vpc cidr range"
}
variable "public_subnet_cidrs" {
  type = list(string)
  description = "public subnet cidr ranges"
}
variable "private_subnet_cidrs" {
  type = list(string)
  description = "private subnet cidr ranges"
}
variable "availability_zones" {
  type = list(string)
  description = "availability zones"
}
variable "environment" {
  type = string
  description = "environment name"
}
variable "aws_region" {
  type = string
  description = "AWS region"
}

//reusable common tags 
variable "common_tags" {
  type = map(string)
  description = "common tags for all resources"
}