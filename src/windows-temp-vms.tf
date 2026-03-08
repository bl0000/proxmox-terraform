## Creating a couple of temp VMs for research

module "server01" {
  source  = "./modules/windows-virtual-machine"
  vm_name = "server01"

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

  ip_address = "10.15.1.243/28"
  gateway    = "10.15.1.241"
}

module "server02" {
  source  = "./modules/windows-virtual-machine"
  vm_name = "server02"

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

  ip_address = "10.15.1.244/28"
  gateway    = "10.15.1.241"
}