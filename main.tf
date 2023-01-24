provider "aws" {
  region     = "ap-south-1"
  /*access_key = "my-access-key"
  secret_key = "my-secret-key"*/
}

terraform {
 backend "s3" {
       encrypt = false 
       bucket  = "tf-state-s3" 
        region = "ap-south-1"
 }
}

resource "aws_vpc" "vpc-test" {
         cidr_block = "10.0.0.0/16" 
         instance_tenancy = "default"
          enable_dns_hostnanes = true 
          tags = {
               Name = "vpc-test"
          }
}
resource "aws_subnet" "public-subnet" {
        vpc_id = aws_vpc.vpc-test.vpc_id 
         cidr_block = "10.0.1.0/24"  
         availability_zone = "ap-south-1a"
           tags = {
               Name = "public-subnet"
          }
  
}
resource "aws_subnet" "private-subnet" {
        vpc_id = aws_vpc.vpc-test.vpc_id 
         cidr_block = "10.0.1.0/24"  
         availability_zone = "ap-south-1b"
           tags = {
               Name = "private-subnet"
          }
}

