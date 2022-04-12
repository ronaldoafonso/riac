
variable "region" {
    description = "AWS region"
    type = string
    default = "us-east-2"
}

variable "groups" {
    description = "AWS IAM groups"
    type = map
}

variable "users" {
    description = "AWS IAM users"
    type = map
}

variable "buckets" {
    description = "AWS Buckets"
    type = list
}

variable "blog_host_name" {
    description = "Host name for the RA blog."
    type = string
}

variable "vpc_name" {
    description = "VPC name"
    type = string
}

variable "vpc_cidr_block" {
    description = "VPC CIDR Block"
    type = string
}

variable "vpc_subnets" {
    description = "VPC Subnets"
    type = map
}

variable "igw_name" {
    description = "IGW name"
    type = string
}
