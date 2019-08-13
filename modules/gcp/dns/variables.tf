variable "name" {
    type = "string"
    description = "Name of DNS record"
}

variable "managed_zone_name" {
    type = "string"
    description = ".name of the google managed zone resource"
}

variable "record_type" {
    type = "string"
    description = "DNS record type i.e. A, MX, CNAME, TXT"
}

variable "ttl" {
    type = "string"
    description = "TTL of DNS record"
}

variable "records" {
    type = "list"
    description = "List of DNS records values i.e [subdomain, subdomain1]"
}

variable "ips" {
    type = "list"
    description = "List of records to match with the DNS name"
}

