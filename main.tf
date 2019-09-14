data "opentelekomcloud_images_image_v2" "image" {
  name = "${var.image_name}"
  most_recent = true
}

resource "opentelekomcloud_vpc_v1" "vpc" {
  name = "${var.vpc_name}"
  cidr = "${var.vpc_cidr}"
}

resource "opentelekomcloud_vpc_subnet_v1" "subnet" {
  name       = "${var.subnet_name}"
  vpc_id     = "${opentelekomcloud_vpc_v1.vpc.id}"
  cidr       = "${var.subnet_cidr}"
  gateway_ip = "${var.subnet_gateway_ip}"
  dns_list   = ["100.125.4.25","8.8.8.8"]
}

resource "opentelekomcloud_networking_secgroup_v2" "quickstart-secgroup" {
  name = "${var.secgroup_name}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "quickstart-secgroup_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.quickstart-secgroup.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "quickstart-secgroup_rule_2" {
  direction         = "egress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.quickstart-secgroup.id}"
}

resource "opentelekomcloud_compute_keypair_v2" "quickstart-key" {
  name       = "quickstart-key"
  public_key = "${var.public_key}"
}

resource "opentelekomcloud_compute_instance_v2" "quickstart" {
  name              = "quickstart"
  availability_zone = "${var.availability_zone}"
  flavor_id         = "${var.flavor_id}"
  key_pair          = "${opentelekomcloud_compute_keypair_v2.quickstart-key.name}"
  security_groups   = ["${opentelekomcloud_networking_secgroup_v2.quickstart-secgroup.id}"]
  network {
    uuid = "${opentelekomcloud_vpc_subnet_v1.subnet.id}"
  }
  block_device {
    boot_index            = 0
    source_type           = "image"
    destination_type      = "volume"
    uuid                  = "${data.opentelekomcloud_images_image_v2.image.id}"
    delete_on_termination = true
    volume_size           = 30
  }
}

resource "opentelekomcloud_networking_floatingip_v2" "eip_quickstart" {
  pool = "admin_external_net"
}

resource "opentelekomcloud_compute_floatingip_associate_v2" "eip_quickstart" {
  floating_ip = "${opentelekomcloud_networking_floatingip_v2.eip_quickstart.address}"
  instance_id = "${opentelekomcloud_compute_instance_v2.quickstart.id}"
}
