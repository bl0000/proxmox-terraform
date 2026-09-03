module "ta01" {
  source  = "./modules/windows-virtual-machine"
  vm_name = "ta01"

  cores  = 4
  memory = 6144

  disks = [
    {
      size = 50
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1009

  ip_address = "10.15.1.231/28"
  gateway    = "10.15.1.225"

  windows_temp_pw = var.windows_temp_pw
}
