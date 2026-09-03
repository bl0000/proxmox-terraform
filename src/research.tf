module "research01" {
  source  = "./modules/virtual-machine"
  vm_name = "research01"

  cores  = 4
  memory = 8192

  disks = [
    {
      size         = 100
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1009

  ip_address = "10.15.1.230/28"
  gateway    = "10.15.1.225"
}
