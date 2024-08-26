#Created VCN, Subnet, Route Table, Security List, DRG, internet gateway, DRg attachment

resource "oci_core_vcn" "cms_vcn" {
    compartment_id = <"compartment-id">
    cidr_block = "10.0.0.0/16"
    display_name = "terraform_vcn"
  }

  resource "oci_core_subnet" "cms_subnet1" {
    cidr_block = "10.0.1.0/24"
    vcn_id = <"vcn.id">
    compartment_id = <"compartment-id">
    display_name = "cms_subnet1"
   route_table_id = <"routetable-id">
   security_list_ids = [<"securitylist.ocid">]
  }

   resource "oci_core_subnet" "cms_subnet2" {
    cidr_block = "10.0.2.0/24"
    vcn_id = <"vcn.id">
    compartment_id = <"compartment-id">
    display_name = "cms_subnet2"
    route_table_id = <"routetable-id">
    security_list_ids = [<"securitylist.ocid">]
  }

 resource "oci_core_drg" "cms_drg" {
  compartment_id = <"compartment-id">
  display_name = "cms_drg"
   
 }
  resource "oci_core_route_table" "cms_subnet1_rt" {
    compartment_id = <"compartment-id">
    vcn_id = <"vcn.id">
    display_name = "cms_subnet1_rt"
    route_rules {
      destination= "0.0.0.0/0"
      # network_entity_id - Target resource (e.g., DRG, Internet Gateway)
      network_entity_id = <"internetgateway.ocid">
    }
  }

    resource "oci_core_route_table" "cms_subnet2_rt" {
    compartment_id = <"compartment-id">
    vcn_id = <"vcn.id">
    display_name = "cms_subnet2_rt"
    route_rules {
      destination= "0.0.0.0/0"
      # network_entity_id - Target resource (e.g., DRG, Internet Gateway)
      network_entity_id = <"internetgateway.ocid">
    }
  }

  resource "oci_core_security_list" "cms_subnet1_sl" {
    compartment_id = <"compartment-id">
    vcn_id = <"vcn.id">
    display_name = "cms_subnet1_sl"
    egress_security_rules {
      destination = "0.0.0.0/0" # Allowing all outbound traffic
      protocol = "all"
      stateless = false
    }
    # Allow TCP 22 from local Desktop
    ingress_security_rules {
      source = <"Public IP/32">
      protocol = "6" # TCP protocol number

        tcp_options {
          min = 22
          max = 22
        }
      }
      # Allow TCP 80 from local Desktop
    ingress_security_rules {
      source = "0.0.0.0/0"
      protocol = "6" # TCP protocol number

        tcp_options {
          min = 80
          max = 80
        }
        stateless = false
      }
      # Allow ICMP from Internet
      ingress_security_rules {
        protocol = "1"
        source = "0.0.0.0/0"
        icmp_options {
          type = "8"
          code = "0"
        }
        stateless = false
      }
      }

  resource "oci_core_security_list" "cms_subnet2_sl" {
    compartment_id = <"compartment-id">
    vcn_id = <"vcn.id">
    display_name = "cms_subnet2_sl"
    egress_security_rules {
      destination = "0.0.0.0/0" # Allowing all outbound traffic
      protocol = "all"
      stateless = false
    }
    # Allow TCP 22 from local Desktop
    ingress_security_rules {
      source = "Public IP/32"
      protocol = "6" # TCP protocol number

        tcp_options {
          min = 22
          max = 22
        }
      }
       # Allow TCP 80 from local Desktop
    ingress_security_rules {
      source = "0.0.0.0/0"
      protocol = "6" # TCP protocol number

        tcp_options {
          min = 80
          max = 80
        }
        stateless = false
      }

      ingress_security_rules {
      source = "10.0.0.0/16"
      protocol = "6" # TCP protocol number

        tcp_options {
          min = 80
          max = 80
        }
        stateless = false
      }
      # Allow ICMP from Internet
      ingress_security_rules {
        protocol = "1"
        source = "0.0.0.0/0"
        icmp_options {
          type = "8"
          code = "0"
        }
        stateless = false
      }
  }

  resource "oci_core_internet_gateway" "cms_igw" {
    compartment_id = <"compartment-id">
    vcn_id = <"vcn.id">
    display_name = "cms_igw"
  }

  resource "oci_core_drg_attachment" "VCN1_drg_attachment" {
    drg_id = <"drg.ocid">
    display_name = "VCN1_drg_attachment"
    network_details {
      id = <"vcn.ocid">
      type = "VCN"
          }
  }
  