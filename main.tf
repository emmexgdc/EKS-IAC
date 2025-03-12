terraform {
 
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 3.0"
   }
 }

 backend "s3" {
   bucket = "gdc-eks-state-store"
   key    = "terraform.tfstate"
   region = "eu-north-1"
   dynamodb_table = "eks-lock-table"
   encrypt = true
 }
}

provider "aws" {
 region = "eu-north-1"
}
 
 module "vpc" {
   source = "./modules/vpc"

    vpc_cidr = var.vpc_cidr
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    availability_zones = var.availability_zones
    cluster_name = var.cluster_name
 }

    module "eks" {
    source = "./modules/eks"
    
    cluster_name = var.cluster_name
    cluster_version = var.eks_version
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnet_ids
    node_groups = var.node_groups
    }