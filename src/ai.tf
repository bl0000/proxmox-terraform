# VM for some Docker-based AI testing

module "ai01" {
  source  = "./modules/virtual-machine"
  vm_name = "ai01"

  cores  = 4
  memory = 4196

  disks = [
    {
      size = 45
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1009

  ip_address = "10.15.1.226/28"
  gateway    = "10.15.1.225"
}

module "openclaw01" {
  source  = "./modules/virtual-machine"
  vm_name = "openclaw01"

  cores  = 4
  memory = 4196

  disks = [
    {
      size = 25
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1009

  ip_address = "10.15.1.227/28"
  gateway    = "10.15.1.225"
}