module "farmsim01" {
  source  = "./modules/virtual-machine"
  vm_name = "farmsim01"

  cores  = 4
  memory = 6144

  disks = [
    {
      size = 45
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1004

  ip_address = "10.15.1.147/28"
  gateway    = "10.15.1.145"
}