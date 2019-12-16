output "external-ip" {
  value = ["ssh ubuntu@${opentelekomcloud_networking_floatingip_v2.eip_quickstart.address}"]
}

