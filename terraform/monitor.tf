# This terraform file adds the new virtual servers to monitoring
# login to the IBM Cloud web ui and navigate to the infrastructure>device 
# to see your running virtual servers. Then select a server then click the 
# monitoring tab to observe the type and status

resource "ibm_compute_monitor" "tutorial_monitor" {
  count = "${var.compute_count}"
#   guest_id = "${element(split(",", var.publicprivatevsi_id), count.index)}"
    guest_id = "${element(split(",", ibm_compute_vm_instance.compute_instances1.id), count.index)}"
    query_type_id = 1
    response_action_id = 1
    wait_cycles = 5
#   notified_users = []
}
