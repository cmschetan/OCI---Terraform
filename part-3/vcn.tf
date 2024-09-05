module "vcn" {
  source = "../Dev/module_vcn"
  vcn_cidr = [ "10.0.0.0/16"]
  display_name = ["cms_vcn1"]
 }
