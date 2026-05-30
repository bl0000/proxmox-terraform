module "mc02" {
  source  = "./modules/virtual-machine"
  vm_name = "mc02"

  cores  = 4
  memory = 12288

  disks = [
    {
      size = 100
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1004

  ip_address = "10.15.1.147/28"
  gateway    = "10.15.1.145"
}