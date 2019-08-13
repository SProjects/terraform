resource "random_string" "firewall_suffix" {
    length = 4
    special = false
}

locals {
    firewal_suffix = "${lower("${random_string.firewall_suffix.result}")}"
}

resource "google_compute_firewall" "this" {
    count = "${var.enable_internal_firewall == "false" ? 1 : 0}"
    name = "${var.name}-${local.firewal_suffix}-firewall"
    network = "${var.network}"

    allow {
        protocol = "${var.protocol}"
        ports = "${var.ports}"
    }

    source_ranges = "${var.source_ranges}"
    target_tags = "${var.target_tags}"
}

resource "google_compute_firewall" "internal" {
    count = "${var.enable_internal_firewall == "true" ? 1 : 0}"
    name = "${var.name}-${local.firewal_suffix}-firewall"
    network = "${var.network}"

    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports = ["0-65535"]
    }

    allow {
        protocol = "udp"
        ports = ["0-65535"]
    }

    source_ranges = "${var.source_ranges}"
}
