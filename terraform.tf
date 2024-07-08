terraform {
    required_providers {
        # https://registry.terraform.io/providers/hashicorp/aws/latest
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.56.1"
        }
    }
}