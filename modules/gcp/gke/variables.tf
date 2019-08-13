variable "name" {
    type = "string"
    description = "Cluster name"
}

variable "min_master_version" {
    type = "string"
    description = "Minimum kubernetes version"
}

variable "region" {
    type = "string"
    description = "Region where the cluster will be spun up"
}

variable "node_count" {
    type = "string"
    description = "Initial number of nodes to be added to cluster"
}

variable "network" {
    type = "string"
    description = "VPC network"
}

variable "subnetwork" {
    type = "string"
    description = "Subnet within VPC network"
}

variable "enable_kubernetes_dashboard" {
    type = "string"
    description = "true to diable and false to enable. Enabled by default."
    default = false
}

variable "machine_type" {
    type = "string"
    description = "Machine type used by thre node pool"
    default = "n1-standard-1"
}


variable "min_node_count" {
    type = "string"
    description = "Minimum node count used in autoscaling"
}

variable "max_node_count" {
    type = "string"
    description = "Maximum nodes auto_scaling can scale to"
}

variable "oauth_scopes" {
    type = "list"
    description = "OAuth scopes that let the nodes access storage, log and monitor"
}

variable "disk_size_gb" {
    type = "string"
    description = "Disk size of nodes in GB e.g. 10GB >= disk_size_bg <= 100GB"
    default = 100
}

variable "disk_type" {
    type = "string"
    description = "Disk type e.g. pd-ssd, pd-standard"
    default = "pd-standard"
}
