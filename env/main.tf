provider "vsphere" {
    user = var.vsphere_user
    password = var.vsphere_password
    vsphere_server = var.vsphere_server

     # If you have a self-signed cert
  allow_unverified_ssl = true
}


data "vsphere_datacenter" "sofia"{
    name = "sofia"
}

data "vsphere_datastore" "datastore"{
    name = "hitachi"
    datacenter_id = data.vsphere_datacenter.sofia.id
}

data "vsphere_network" "network" {
  name          = "public"
  datacenter_id = data.vsphere_datacenter.dc.id
}