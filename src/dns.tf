# Platform DNS (docs/architecture-review.md §1.5 and §3.3 in labplane): BIND9 on
# VLAN 1012 (10.15.12.0/24, gateway 10.15.12.1, fw01 Port3.1012). Pets: not
# labplane guests, no pool. dns01 is the primary, dns02 the secondary; they
# must never share a node. Serve, don't cut over: existing clients and DHCP
# stay on dc01 until Ben switches them by hand. Configured by the playbook
# platform/install_bind.yml in ansible-playbooks.
# onboot: the bpg provider defaults on_boot to true (see platform.tf).

module "dns01" {
  source    = "./modules/virtual-machine"
  vm_name   = "dns01"
  node_name = "proxmox01"

  cores  = 1
  memory = 512

  disks = [{ size = 8, datastore_id = "nvme-lvm" }]

  vlan_tag   = 1012
  ip_address = "10.15.12.11/24"
  gateway    = "10.15.12.1"
}

module "dns02" {
  source    = "./modules/virtual-machine"
  vm_name   = "dns02"
  node_name = "proxmox03"

  cores  = 1
  memory = 512

  disks = [{ size = 8, datastore_id = "nvme-lvm" }]

  vlan_tag   = 1012
  ip_address = "10.15.12.12/24"
  gateway    = "10.15.12.1"
}
