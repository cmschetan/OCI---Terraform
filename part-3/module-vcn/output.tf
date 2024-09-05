output "vcn_ids" {
  value = [for vcn in oci_core_vcn.vcn : vcn.id]
    description = "VCN ID of the vcn"
}