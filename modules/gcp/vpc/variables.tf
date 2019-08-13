variable "region" {
  type = "string"
  description = "Examples: us-central1, us-east1, europe-north1. More here: https://cloud.google.com/compute/docs/regions-zones/"
}

variable "name" {
    type = "string"
    description = "VPC network name"
}

variable "routing_mode" {
    type = "string"
    description = "Network routing mode. Options: REGIONAL and GLOBAL"
}

variable "public_subnet_cidr_range" {
    type = "string"
    description = "Range of internal addresses owned by the subnet"
}

variable "private_subnet_cidr_range" {
    type = "string"
    description = "Range of internal addresses owned by the subnet"
}
