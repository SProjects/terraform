
resource "random_id" "vpc_id_string" {
    byte_length = 4
}
resource "google_compute_network" "this" {
    name = "${var.name}-${random_id.vpc_id_string.dec}"
    auto_create_subnetworks = false
    routing_mode = "${var.routing_mode}"
}

resource "google_compute_subnetwork" "public_subnetwork" {
    name = "${var.name}-${random_id.vpc_id_string.dec}-public-network"
    region = "${var.region}"
    network = "${google_compute_network.this.self_link}"
    ip_cidr_range = "${var.public_subnet_cidr_range}"
}

resource "google_compute_subnetwork" "private_subnetwork" {
    name = "${var.name}-${random_id.vpc_id_string.dec}-private-network"
    region = "${var.region}"
    network = "${google_compute_network.this.self_link}"
    ip_cidr_range = "${var.private_subnet_cidr_range}"
}
