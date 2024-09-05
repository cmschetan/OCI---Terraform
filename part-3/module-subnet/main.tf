resource "oci_core_subnet" "subnet" {
  count = length(var.cidr_block)
  compartment_id = var.compartment_id
  vcn_id = var.vcn_ids[0]
  cidr_block = var.cidr_block[count.index]
  prohibit_public_ip_on_vnic = var.prohibit_public_ip_on_vnic[count.index]
  display_name = var.display_name[count.index]
}