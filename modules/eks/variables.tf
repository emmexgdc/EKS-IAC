variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The desired Kubernetes version for the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the private subnets"
  type        = list(string)
}

variable "node_groups" {
  description = "A list of maps defining the node groups for the EKS cluster"
  type        = map(object({
    instance_type = list(string)
    capacity_type = string
    scaling_config = object({
      min_size    = number
      max_size    = number
      desired_size = number
    })
  }))
  
}