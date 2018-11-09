#This terraform file creates the compute resources that will be
#deployed onto public/private network and onto private only
#networks. The number of resources are dependent on the count
#variable. Each virtual server is deployed
# - with a unique host name using an incremental extension
# - with an OS, domain, sshkey, vlans defined by variable
# - to a region/availabiltiy zone defined by variable
# - linked to a single file storage
# - assigned a security gtroup policy


#Create multiple virtual servers on public/private networks

resource "ibm_compute_vm_instance" "compute_instances1" {
  count = "${var.compute_count}"
  os_reference_code = "${var.osrefcode}"
  hostname = "${format("virtualserver-publicprivate-%02d", count.index + 1)}"
  domain = "${var.domain}"
  datacenter = "${var.availability_zone}"
  file_storage_ids = ["${ibm_storage_file.storage1.id}"]
  network_speed = 10
  cores = 1
  memory = 1024
  disks = [25, 10]
  ssh_key_ids = ["${ibm_compute_ssh_key.ssh_key.id}"]
  local_disk = false
  private_security_group_ids = ["${ibm_security_group.sg2.id}"]
  public_security_group_ids = ["${ibm_security_group.sg1.id}"]
  private_vlan_id = "${var.privatevlanid}"
  public_vlan_id = "${var.publicvlanid}"
}

#Create multiple virtual srevers on private network

resource "ibm_compute_vm_instance" "compute_instances2" {
  count = "${var.compute_count}"
  os_reference_code = "${var.osrefcode}"
  hostname = "${format("virtualserver-private-%02d", count.index + 1)}"
  domain = "${var.domain}"
  datacenter = "${var.availability_zone}"
  file_storage_ids = ["${ibm_storage_file.storage2.id}"]
  network_speed = 10
  cores = 1
  memory = 1024
  disks = [25, 10]
  ssh_key_ids = ["${ibm_compute_ssh_key.ssh_key.id}"]
  private_security_group_ids = ["${ibm_security_group.sg2.id}"]
  local_disk = false
  private_vlan_id = "${var.privatevlanid}"
}
