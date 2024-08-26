resource "oci_core_instance" "cms01" {
  availability_domain = <"AD-name">
  compartment_id      = <"compartment-id">
  shape               = "VM.Standard.A1.Flex"
  shape_config {
    ocpus = "1"
    memory_in_gbs = "6"
  }

  source_details {
    source_id               = <"image-ocid">
    source_type             = "image"
    boot_volume_size_in_gbs = "50"
  }
  display_name = "cms01"
  metadata = {
    ssh_authorized_keys = file(<"Path to key file">)
    }
  create_vnic_details {
    subnet_id = <"subnet.ocid">
  }
  preserve_boot_volume = "false"
}

resource "oci_core_instance" "cms02" {
  availability_domain = <"AD-name">
  compartment_id      = <"compartment-id">
  shape               = "VM.Standard.A1.Flex"
  shape_config {
    ocpus = "1"
    memory_in_gbs = "6"
  }

  source_details {
    source_id               = <"image-ocid">
    source_type             = "image"
    boot_volume_size_in_gbs = "50"
  }
  display_name = "cms02"
  metadata = {
    ssh_authorized_keys = file(<"Path to key file">")
      }
  create_vnic_details {
    subnet_id = <"subnet.ocid">
  }
  preserve_boot_volume = "false"
}
