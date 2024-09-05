
variable "usernames" {
  type = list(string)
  default = [ "cms", "AM", "AC" ]
}


resource "oci_identity_user" "user" {
  for_each = toset(var.usernames)
  name = each.value
  description = "OCI User"
}

output "username_name" {
  value = values(oci_identity_user.user)[*].name
  }

output "uppercase_username" {
  value = [for name in var.usernames : upper(name)]
}