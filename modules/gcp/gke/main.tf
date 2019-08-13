resource "random_string" "cluster_suffix" {
    length = 4
    special = false
}

locals {
    cluster_suffix = "${lower("${random_string.cluster_suffix.result}")}"
}



resource "google_container_cluster" "this" {
    name = "${var.name}-${local.cluster_suffix}-cluster"
    location = "${var.region}"

    master_auth {
        username = ""
        password = ""

        client_certificate_config {
        issue_client_certificate = false
        }
    }

    min_master_version = "${var.min_master_version}"

    remove_default_node_pool = true
    initial_node_count = 1

    network = "${var.network}"
    subnetwork = "${var.subnetwork}"

    addons_config {
        kubernetes_dashboard {
            disabled = "${var.enable_kubernetes_dashboard}"
        } 
    }
}

resource "google_container_node_pool" "cluster_node_pool" {
    name = "${var.name}-${local.cluster_suffix}-node-pool"
    cluster = "${google_container_cluster.this.name}"
    location = "${var.region}"

    node_count = "${var.node_count}"

    node_config {
        machine_type = "${var.machine_type}"
        disk_size_gb = "${var.disk_size_gb}"
        disk_type = "${var.disk_type}"

        metadata = {
            disable-legacy-endpoints = "true"
        }

        oauth_scopes = "${var.oauth_scopes}"

        tags = ["${var.name}-server"]
    }

    autoscaling {
        min_node_count = "${var.min_node_count}"
        max_node_count = "${var.max_node_count}"
    }

    timeouts {
        create = "30m"
        update = "20m"
    }
}
