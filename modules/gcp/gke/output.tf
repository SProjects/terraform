output "master_kubernetes_version" {
  value = "${google_container_cluster.this.master_version}"
  description = "Kubernetes version used on master plane"
}

output "master_endpoint_ip" {
  value = "${google_container_cluster.this.endpoint}"
  description = "Master endpoint IP"
}
