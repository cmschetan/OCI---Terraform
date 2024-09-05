resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_id
  for_each = {for idx, cidr in var.vcn_cidr : idx => cidr}
  cidr_block = each.value
  display_name = var.display_name[each.key]
}