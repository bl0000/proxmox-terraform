# Platform guests (docs/architecture-review.md §3.3 in labplane). Pets: not
# labplane guests, no pool. Temporarily on VLAN 1020 (10.15.8.0/22), outside
# labplane's IPAM range (10.15.8.20-10.15.11.250); re-address to VLAN 1012
# (10.15.12.0/24) when the network prep lands. They must never share a node.
# onboot is set by hand/Ansible until the module exposes it (see MR notes).

module "sem01" {
  source    = "./modules/virtual-machine"
  vm_name   = "sem01"
  node_name = "proxmox02"

  cores  = 1
  memory = 2048

  disks = [{ size = 20, datastore_id = "nvme-lvm" }]

  vlan_tag   = 1020
  ip_address = "10.15.8.10/22"
  gateway    = "10.15.8.1"
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
