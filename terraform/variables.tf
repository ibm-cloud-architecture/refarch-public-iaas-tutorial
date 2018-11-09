#This terraform file contains the variables and default values for 
#this architecture. Default values will be used unless changed at 
#deployment time.

#  The credentials needed to deploy all resources. 
# Ensure the user/apikey have proper permissions.

variable iaasapikey {
  description = "iaas api key"
  default = ""
}
variable iaasusername {
  description = "iaas user name"
  default = ""
}

# The actual public key that will be created in IBM Cloud and
# assigned to the virtual servers

variable ssh_key {
  description = "ssh public key"
  default = ""
}

variable ssh_label {
  description = "ssh label"
  default = "testkey"
}
variable ssh_notes {
  description = "ssh public key notes"
  default = "This is an ssh public key"
}


# Pre-existing VLANs. They are deployed using a ticket request.
# The VLAN ID can be obtained by accessing the VLAN and selected
# from the URL.

variable privatevlanid {
  description = "private VLAN"
  default = ""
}
variable publicvlanid {
  description = "public VLAN"
  default = ""
}

#The zone and region to deploy the architecture. The tutorial uses a 
#single zone. 

variable availability_zone {
  description = "location to deploy"
  default = ""
}

variable region {
  description = "IBM Cloud region"
  default = ""
}

# The specific virtual server configuration items

variable osrefcode {
  description = "operating system reference code for VMs"
  default = "DEBIAN_8_64"
}
variable domain {
  description = "domain of the VMs"
  default = "mybluemix.com"
}

# The number of each type of virtual server that
# will be deployed using the compute.tf file.

variable compute_count {
  description = "number of VMs"
  default = "1"
}


