#This terraform file defines the security aspect implementation
#Two security groups are created - one to control communications 
#on the public VLAN. The other group to control communications
#on the private network. The groups are applied to the virtual
#servers during deployment - using the compute.tf file.

# Create a security group to limit communications on the public network 

resource "ibm_security_group" "sg1" {
    name = "sg1"
    description = "public app traffic"
}

# Create a rule to limit traffic to https on public network

resource "ibm_security_group_rule" "port_443" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 443
    port_range_max = 443
    protocol = "tcp"
    remote_ip = "0.0.0.0/8"
    security_group_id = "${ibm_security_group.sg1.id}"
    depends_on = ["ibm_security_group.sg1"]
}

# Create a security group to limit communications on private network

resource "ibm_security_group" "sg2" {
    name = "sg2"
    description = "private app traffic"
}

#Create a rule to limit traffic to ssh on private network

resource "ibm_security_group_rule" "port_22" {
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 22
    port_range_max = 22
    protocol = "tcp"
    remote_ip = "0.0.0.0/8"
    security_group_id = "${ibm_security_group.sg2.id}"
}
