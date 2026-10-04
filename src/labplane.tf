# labplane control plane (Docker host). A pet, not a labplane guest: it has no
# pool, so the labplane token cannot touch it. Needs PVE at 10.12.10.10:8006.

module "labplane01" {
  source  = "./modules/virtual-machine"
  vm_name = "labplane01"

  cores  = 2
  memory = 4096

  disks = [
    {
      size         = 40
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1009

  ip_address = "10.15.1.232/28"
  gateway    = "10.15.1.225"
}
