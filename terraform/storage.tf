#This terraform file creates two file storage resources
#that will be linked to corresponding virtual servers.
# storage1 links to virtual server1 and the same for
#storage2 and virtual server2.

#Create file storage
resource "ibm_storage_file" "storage1" {
  type = "Performance"
  datacenter = "${var.availability_zone}"
  capacity = "20"
  iops = "100"
}

resource "ibm_storage_file" "storage2" {
  type = "Performance"
  datacenter = "${var.availability_zone}"
  capacity = "20"
  iops = "100"
}
