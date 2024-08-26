
resource "oci_load_balancer_load_balancer" "example_load_balancer" {
  compartment_id       = <"compartment-id">
  display_name         = "cms-load-balancer"
  shape                = "flexible"  # Can be "flexible" or a fixed shape like "100Mbps"
  shape_details {
    maximum_bandwidth_in_mbps = "10"
    minimum_bandwidth_in_mbps = "10"
  }
  subnet_ids           = [<"subnet.ocid">]
  is_private           = false  # Set to true for a private load balancer
  #idle_timeout_in_seconds = 300
}

resource "oci_load_balancer_backend_set" "cms_backend_set" {
    #Required
    health_checker {
        protocol = "TCP"
        port = "80"
        }
    
    load_balancer_id = <"loadbalancer.ocid">
    name = "cms_backend_set"
    policy = "ROUND_ROBIN"
}

resource "oci_load_balancer_backend" "cms_backend01" {
       backendset_name = "cms_backend_set"
       ip_address = <"IP Address">
       load_balancer_id = <"loadbalancer.ocid">
       port = "80"
     }

resource "oci_load_balancer_backend" "cms_backend02" {
       backendset_name = "cms_backend_set"
       ip_address = <"IP Address">
       load_balancer_id = "ocid1.loadbalancer.oc1.ap-mumbai-1.aaaaaaaaznvhc42bsnqloze4y3jal4kstu5h45mj56zpvyi57lkbudsobkwq"
       port = "80"
     }

resource "oci_load_balancer_listener" "cms_lb_listener" {
    default_backend_set_name = "cms_backend_set"
    load_balancer_id = <"loadbalancer.ocid">
    name = "cms_lb_listener"
    port = "80"
    protocol = "TCP"
  }

