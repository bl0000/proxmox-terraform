module "dns01" {
  source  = "./modules/virtual-machine"
  vm_name = "dns01"

  cores  = 1
  memory = 1024

  disks = [
    {
      size = 15
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1012

  ip_address = "10.15.1.146/28"
  gateway    = "10.15.1.145"
}
