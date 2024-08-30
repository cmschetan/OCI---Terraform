compartment_id = "ocid1.tenancy.oc1..aaaaaaaa3ajiukdynhuqq6aood6qpctxky3tyd4map6uebvjn2qan4xsykxq"
cms_vcn_subnet = ["10.0.1.0/24", "10.0.2.0/24","10.0.3.0/24"]

ingress_security_rules_source = ["182.73.228.54/32","0.0.0.0/0"]
ingress_security_rules_protocol = ["6","1"]    # TCP=6, ICMP = 1
ingress_security_rules_tcp_options = ["22","80"]
ingress_security_rules_icmp_options_type = "8"
ingress_security_rules_stateless = "false"

egress_security_rules_destination = "0.0.0.0/0"
egress_security_rules_protocol = "all"
egress_security_rules_stateless = "false"

AD = "LSnU:AP-MUMBAI-1-AD-1"
image_id = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaa46265t5fz3w4ayp4njl2duzhbo7mhtqr374jlul3olcznqo5xfua"
compute_shape = "VM.Standard.A1.Flex"
