resource "oci_core_instance" "cms_instance01" {
  compartment_id = oci_identity_compartment.EBS-App.id
  availability_domain = var.AD
  shape = var.compute_shape
  shape_config {
    ocpus = "1"
    memory_in_gbs = "6"
  }

  source_details {
    source_id = var.image_id
    source_type = "image"
    boot_volume_size_in_gbs = "50"
  }
  display_name = "cms-instance-01"
  metadata = {
    ssh_authorized_keys = file("D:\\terraform\\Projects\\keys\\cms.pub")
    }
  create_vnic_details {
    subnet_id = oci_core_subnet.cms_vcn_subnet2.id
  }
  preserve_boot_volume = "false"
}


resource "oci_core_instance" "cms_instance02" {
  compartment_id = oci_identity_compartment.EBS-App.id
  availability_domain = var.AD
  shape = var.compute_shape
  shape_config {
    ocpus = "1"
    memory_in_gbs = "6"
  }

  source_details {
    source_id = var.image_id
    source_type = "image"
    boot_volume_size_in_gbs = "50"
  }
  display_name = "cms-instance-02"
  metadata = {
    ssh_authorized_keys = file("D:\\terraform\\Projects\\keys\\cms.pub")
    }
  create_vnic_details {
    subnet_id = oci_core_subnet.cms_vcn_subnet2.id
  }
  preserve_boot_volume = "false"
}


