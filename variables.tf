
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
