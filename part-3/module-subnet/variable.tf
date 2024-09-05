variable "compartment_id" { 
 description = "subnet compartment id"
 default = <"compartment.ocid">
 type = string
}

variable "cidr_block" {
  description = "Subnet CIDR block"
  type = list(string)
}

variable "vcn_ids" {
  description = "VCN ID of teh subnet"
  type = list(string)
}

variable "display_name" {
  type = list(string)
  description = "Display name of the subnet"
}

variable "prohibit_public_ip_on_vnic" {
  description = "public or private subnet"
  type = list(string)
}
  
