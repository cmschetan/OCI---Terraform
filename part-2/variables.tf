

variable "compartment_id" {
    description = "Root Compartment ID"
    type = string
}

variable "cms_vcn_subnet" {
  description = "Subnet CIDR"
  type = list(string)
}

variable "ingress_security_rules_source" {
  description = "Ingress Security List Source"
  type = list(string)
  }

variable "ingress_security_rules_protocol" {
  description = "Ingress Security List Protocol"
  type = list(number)
  default = [ 0 ]
}

variable "ingress_security_rules_tcp_options" {
  description = "Ingress security list TCP ports"
  type = list(number)
}

variable "ingress_security_rules_icmp_options_type" {
  description = "ingress Security list ports for ICMP"
  type = number
}

variable "ingress_security_rules_stateless" {
  description = "Stateful status ingress security rule"
  type = string
}

variable "egress_security_rules_destination" {
  description = "Source CIDR for egress rule"
  type = string
}

variable "egress_security_rules_protocol" {
  description = "Egress security rule protocol"
  type = string
}

variable "egress_security_rules_stateless" {
  description = "Stateful security list"
  type = string
}

variable "AD" {
  description = "Availability Domain"
  type = string
 }

variable "compute_shape" {
  description = "Compute shape"
  type = string
 }

 variable "image_id" {
   description = "Image id"
   type = string
 }





