output "registered_dns" {
  value = "${google_dns_record_set.this.*.rrdatas}"
}
