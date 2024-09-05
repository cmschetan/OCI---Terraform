output "subnet_ids" {
  value = [for subnet in oci_core_subnet.subnet : subnet.id]
  description = "Subnet ID of the subnet"
}