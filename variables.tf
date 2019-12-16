# OTC vars
variable "access_key" {
  description = "Auth Access Key"
}

variable "secret_key" {
  description = "Auth Secret Key"
}

variable "auth_url" {
  description = "IAM Auth Url"
  default     = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "tenant_name" {
  description = "Name of the tenant"
  default     = "eu-de"
}

variable "region" {
  description = "Cloud Region"
  default     = "eu-de"
}

variable "availability_zone" {
  description = "Availability Zone"
  default     = "eu-de-01"
}

variable "vpc_name" {
  description = "Name of VPC"
  default     = "quickstart-vpc"
}

variable "vpc_cidr" {
  description = "VPC network"
  default     = "192.168.0.0/16"
}

variable "subnet_name" {
  description = "Subnetwork name"
  default     = "quickstart-subnet"
}

variable "subnet_cidr" {
  description = "Sub Network CIDR"
  default     = "192.168.1.0/24"
}

variable "dns_list" {
  description = "list of DNS servers"
  default     = ["100.125.4.25", "8.8.8.8"]
}

variable "subnet_gateway_ip" {
  description = "Subnet Gateway"
  default     = "192.168.1.1"
}

variable "secgroup_name" {
  description = "Secgroup name"
  default     = "quickstart-secgroup"
}

variable "image_name" {
  description = "Name of the image"
  default     = "Standard_Ubuntu_18.04_latest"
}

variable "flavor_id" {
  description = "ID of Flavor"
  default     = "c3.large.2"
}

variable "public_key" {
  description = "ssh public key to use"
  default     = ""
}

