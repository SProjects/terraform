resource "google_dns_record_set" "this" {
    count = "${length(var.records)}"
    name = "${element(var.records, count.index)}.${var.name}"
    managed_zone = "${var.managed_zone_name}"
    type = "${var.record_type}"
    ttl = "${var.ttl}"

    rrdatas = ["${var.ips}"]
}