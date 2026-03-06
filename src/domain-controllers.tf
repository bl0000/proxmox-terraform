module "dc01" {
  source  = "./modules/virtual-machine"
  vm_name = "dc01"

  cores  = 4
  memory = 4096

  disks = [
    {
      size = 40
      datastore_id = "nvme-lvm"
    }
  ]

  ## Need to create new VLAN
  vlan_tag = 1011

  ip_address = "10.15.1.242/28"
  gateway    = "10.15.1.241"
}