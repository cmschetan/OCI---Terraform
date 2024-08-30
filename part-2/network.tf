resource "oci_core_vcn" "cms_vcn" {
    compartment_id = oci_identity_compartment.Network.id
    display_name = "cms_vcn"
    cidr_block = "10.0.0.0/16"
}

resource "oci_core_subnet" "cms_vcn_subnet1" {
  cidr_block = var.cms_vcn_subnet[0]
  compartment_id = oci_identity_compartment.Network.id
  vcn_id = oci_core_vcn.cms_vcn.id
  display_name = "LB Subnet01"
  prohibit_public_ip_on_vnic = false
  route_table_id = oci_core_route_table.cms_vcn_subnet01_rt.id
  security_list_ids = [oci_core_security_list.cms_vcn_subnet01_sl.id]
}

resource "oci_core_subnet" "cms_vcn_subnet2" {
  cidr_block = var.cms_vcn_subnet[1]
  compartment_id = oci_identity_compartment.Network.id
  vcn_id = oci_core_vcn.cms_vcn.id
  display_name = "Apps_subnet02"
  prohibit_public_ip_on_vnic = false
  route_table_id = oci_core_route_table.cms_vcn_subnet02_rt.id
  security_list_ids = [oci_core_security_list.cms_vcn_subnet02_sl.id]
}

resource "oci_core_subnet" "cms_vcn_subnet3" {
  cidr_block = var.cms_vcn_subnet[2]
  compartment_id = oci_identity_compartment.Network.id
  vcn_id = oci_core_vcn.cms_vcn.id
  display_name = "DB_subnet03"
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_drg" "cms_drg" {
  compartment_id = oci_identity_compartment.Network.id
  display_name = "cms_drg"
}

resource "oci_core_drg_attachment" "cms_vcn_drg_attachment" {
    drg_id = oci_core_drg.cms_drg.id
    vcn_id = oci_core_vcn.cms_vcn.id
    display_name = "cms_vcn_drg_attachment"
}

resource "oci_core_security_list" "cms_vcn_subnet01_sl" {
  compartment_id = oci_identity_compartment.Network.id
  vcn_id = oci_core_vcn.cms_vcn.id
  display_name = "cms_vcn_subnet01_sl"
  egress_security_rules {
    destination = var.egress_security_rules_destination
    protocol = var.egress_security_rules_protocol
    stateless = var.egress_security_rules_stateless
  }
  ingress_security_rules {
    protocol = var.ingress_security_rules_protocol[0]
    source = var.ingress_security_rules_source[1]
    stateless = var.ingress_security_rules_stateless
    tcp_options {
      min = var.ingress_security_rules_tcp_options[1]
      max = var.ingress_security_rules_tcp_options[1]
    }
  }
  ingress_security_rules {
    protocol = var.ingress_security_rules_protocol[1]
    source = var.ingress_security_rules_source[1]
    stateless = var.ingress_security_rules_stateless
    icmp_options {
      type = var.ingress_security_rules_icmp_options_type
    }
  }
}

resource "oci_core_security_list" "cms_vcn_subnet02_sl" {
  compartment_id = oci_identity_compartment.Network.id
  vcn_id = oci_core_vcn.cms_vcn.id
  display_name = "cms_vcn_subnet02_sl"
  egress_security_rules {
    destination = var.egress_security_rules_destination
    protocol = var.egress_security_rules_protocol
    stateless = var.egress_security_rules_stateless
  }
  ingress_security_rules {
    protocol = var.ingress_security_rules_protocol[0]
    source = var.ingress_security_rules_source[1]
    stateless = var.ingress_security_rules_stateless
    tcp_options {
      min = var.ingress_security_rules_tcp_options[0]
      max = var.ingress_security_rules_tcp_options[0]
    }
  }

    ingress_security_rules {
    protocol = var.ingress_security_rules_protocol[0]
    source = var.ingress_security_rules_source[1]
    stateless = var.ingress_security_rules_stateless
    tcp_options {
      min = var.ingress_security_rules_tcp_options[1]
      max = var.ingress_security_rules_tcp_options[1]
    }
  }
  ingress_security_rules {
    protocol = var.ingress_security_rules_protocol[0]
    source = var.ingress_security_rules_source[0]
    stateless = var.ingress_security_rules_stateless
    icmp_options {
      type = var.ingress_security_rules_icmp_options_type
    }
  }
  ingress_security_rules {
    protocol = var.ingress_security_rules_protocol[0]
    source = var.cms_vcn_subnet[0]
    stateless = var.ingress_security_rules_stateless
    tcp_options {
      min = var.ingress_security_rules_tcp_options[1]
      max = var.ingress_security_rules_tcp_options[1]
    }
  }
  ingress_security_rules {
    protocol = var.ingress_security_rules_protocol[0]
    source = "10.0.1.193/32"
    stateless = var.ingress_security_rules_stateless
    tcp_options {
      min = var.ingress_security_rules_tcp_options[1]
      max = var.ingress_security_rules_tcp_options[1]
    }
  }
  ingress_security_rules {
    protocol = var.ingress_security_rules_protocol[1]
    source = var.ingress_security_rules_source[0]
    stateless = var.ingress_security_rules_stateless
    icmp_options {
      type = var.ingress_security_rules_icmp_options_type
    }
  }
  ingress_security_rules {
    protocol = var.ingress_security_rules_protocol[0]
    source = "144.24.108.156/32"
    stateless = var.ingress_security_rules_stateless
    tcp_options {
      min = var.ingress_security_rules_tcp_options[1]
      max = var.ingress_security_rules_tcp_options[1]
    }
  }
  }

resource "oci_core_internet_gateway" "cms_igw" {
    compartment_id = oci_identity_compartment.Network.id
    vcn_id = oci_core_vcn.cms_vcn.id
    display_name = "cms_igw"
 }

 resource "oci_core_route_table" "cms_vcn_subnet01_rt" {
    compartment_id = oci_identity_compartment.Network.id
    vcn_id = oci_core_vcn.cms_vcn.id
    display_name = "cms_vcn_subnet01_rt"
    route_rules {
      destination = "0.0.0.0/0"
      network_entity_id = oci_core_internet_gateway.cms_igw.id
    }
 }

 resource "oci_core_route_table" "cms_vcn_subnet02_rt" {
    compartment_id = oci_identity_compartment.Network.id
    vcn_id = oci_core_vcn.cms_vcn.id
    display_name = "cms_vcn_subnet02_rt"
    route_rules {
      destination = "0.0.0.0/0"
      network_entity_id = oci_core_internet_gateway.cms_igw.id
    }
  }
