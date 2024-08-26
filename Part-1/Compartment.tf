#Compartment creation
resource "oci_identity_compartment" "chetan" {
  #Required
  compartment_id = "<tenancy.ocid>"
  description    = "New compartment"
  name           = "ChetanTerraform"
}
