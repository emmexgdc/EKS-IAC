variable "region" {
  description = "The region in which the resources will be created."
  default     = "eu-north-1"
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
  type = string
}

variable "availability_zones" {
  description = "values for availability zones"
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  type = list(string)
}

variable "public_subnet_cidrs" {
  description = "The CIDR block for the public subnets."
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  type = list(string)
}

variable "private_subnet_cidrs" {
  description = "The CIDR block for the private subnets."
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  type = list(string)
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  default     = "gdc-eks-cluster"
  type = string
}

variable "eks_version" {
  description = "The version of EKS."
  default     = "1.28"
  type = string
}

variable "node_groups" {
  description = "The node groups for the EKS cluster."
  type = map(object({
    instance_type = list(string)
    capacity_type = string
    scaling_config = object({
      desired_size = number
      min_size = number
      max_size = number
    })
  }))
    default = {
     general = {
        instance_type = ["t3.medium"]
        capacity_type = "ON_DEMAND"
        scaling_config = {
            desired_size = 2
            min_size = 1
            max_size = 4
        }
     }
    }
}