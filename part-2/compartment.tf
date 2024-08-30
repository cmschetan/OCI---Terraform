resource "oci_identity_compartment" "compartment" {
 compartment_id = var.compartment_id
 name = "cmsterraform"
 description = "Compartment for compute"
}

resource "oci_identity_compartment" "Network" {
    description = "Network compartment"
    compartment_id = oci_identity_compartment.compartment.id
    name = "Network"
}

resource "oci_identity_compartment" "EBS" {
    compartment_id = oci_identity_compartment.compartment.id
    name = "EBS"
    description = "EBS Compartment"
  
}

resource "oci_identity_compartment" "EBS-App" {
    description = "EBS Application COmpartment"
    compartment_id = oci_identity_compartment.EBS.id
    name = "EBS-App"
}

resource "oci_identity_compartment" "EBS-DB" {
    description = "EBS Database compartment"
    compartment_id = oci_identity_compartment.EBS.id
    name = "EBS-DB"
}

resource "oci_identity_compartment" "EBS-LB" {
  description = "LB compartment"
  compartment_id = oci_identity_compartment.EBS.id
  name = "EBS-LB"
}

