module "test06" {
  source  = "./modules/virtual-machine"
  vm_name = "test06"

  cores  = 4
  memory = 4096

  disks = [
    {
      size = 25
    }
  ]

  ip_address = "10.0.0.6/24"
  gateway    = "10.0.0.2"
}
