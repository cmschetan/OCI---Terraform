variable "compartment_id" {
  description = "Network compartment id"
  default = <"compartment.ocid">
  type = string
}

variable "vcn_cidr" {
  description = "vcn CIDR block"
  type = list(string)
}

variable "display_name" {
    description = "Name of my VCN"
    type = list(string)
}
