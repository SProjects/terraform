variable "name" {
    type = "string"
    description = "Firewall name"
}

variable "network" {
    type = "string"
    description = "VPC network name or self_link (required)"
}

variable "protocol" {
    type = "string"
    description = "Traffic type i.e. tcp, udp, icmp"
    default = ""
}

variable "ports" {
    type = "list"
    description = "Ports to open i.e 80, 443"
    default = []
}

variable "source_ranges" {
    type = "list"
    description = "CIDRs identifying networks with allowable IPs"
}

variable "target_tags" {
    type = "list"
    description = "Tags of resources to target"
    default = []
}

variable "enable_internal_firewall" {
    type = "string"
    description = "Determines if internal firewall should be setup or not."
    default = "false"
}
