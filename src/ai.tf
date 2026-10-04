# VM for some Docker-based AI testing

module "claude01" {
  source  = "./modules/virtual-machine"
  vm_name = "claude01"

  cores  = 4
  memory = 4196

  disks = [
    {
      size = 35
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1009

  ip_address = "10.15.1.229/28"
  gateway    = "10.15.1.225"
}