# Platform guests (docs/architecture-review.md §3.3 in labplane). Pets: not
# labplane guests, no pool. Moving from VLAN 1020 (10.15.8.0/22) onto VLAN 1012
# Platform (10.15.12.0/24, gateway fw01 .1; address plan in review §1.2) one
# at a time. They must never share a node.
# onboot: the bpg provider defaults on_boot to true (checked in the plan).

module "sem01" {
  source    = "./modules/virtual-machine"
  vm_name   = "sem01"
  node_name = "proxmox02"

  cores  = 1
  memory = 2048

  disks = [{ size = 20, datastore_id = "nvme-lvm" }]

  vlan_tag   = 1012
  ip_address = "10.15.12.21/24"
  gateway    = "10.15.12.1"
}

module "zbx01" {
  source    = "./modules/virtual-machine"
  vm_name   = "zbx01"
  node_name = "proxmox03"

  cores  = 2
  memory = 2048

  disks = [{ size = 30, datastore_id = "nvme-lvm" }]

  vlan_tag   = 1020
  ip_address = "10.15.8.11/22"
  gateway    = "10.15.8.1"
}
