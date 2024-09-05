module "subnet" {
  source = "../Dev/module_subnet"
  cidr_block = [ "10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24"]
  vcn_ids = module.vcn.vcn_ids
  display_name = ["cms_vcn01_subnet01","cms_vcn01_subnet02","cms_vcn01_subnet03","cms_vcn01_subnet04"]
  prohibit_public_ip_on_vnic = ["true","true","false","false"]
}

