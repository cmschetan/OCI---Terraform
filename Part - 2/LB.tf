resource "oci_load_balancer_load_balancer" "cms_lb" {
    compartment_id = oci_identity_compartment.Network.id
    subnet_ids = [oci_core_subnet.cms_vcn_subnet1.id]
    display_name = "cms_lb"
    shape = "flexible"
    shape_details {
      maximum_bandwidth_in_mbps = 10
      minimum_bandwidth_in_mbps = 10
    }
  }

  resource "oci_load_balancer_backend_set" "cms_lb_backend_set" {
    load_balancer_id = oci_load_balancer_load_balancer.cms_lb.id
    name = "cms_lb_backend_set"
    policy = "ROUND_ROBIN"
    health_checker {
      protocol = "TCP"
      port = "80"
    }
  }

  resource "oci_load_balancer_backend" "cms_lb_backend-01" {
     backendset_name = oci_load_balancer_backend_set.cms_lb_backend_set.name
     ip_address = "10.0.2.165"
     port = "80"
     load_balancer_id = oci_load_balancer_load_balancer.cms_lb.id
  }

  resource "oci_load_balancer_backend" "cms_lb_backend-02" {
     backendset_name = oci_load_balancer_backend_set.cms_lb_backend_set.name
     ip_address = "10.0.2.9"
     port = "80"
     load_balancer_id = oci_load_balancer_load_balancer.cms_lb.id
  }

  resource "oci_load_balancer_listener" "cms_lb_listener" {
    name = "cms_lb_listener"
    load_balancer_id = oci_load_balancer_load_balancer.cms_lb.id
    protocol = "TCP"
    port = "80"
    default_backend_set_name = oci_load_balancer_backend_set.cms_lb_backend_set.name
  }