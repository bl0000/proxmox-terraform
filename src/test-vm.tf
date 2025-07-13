module "test04" {
  source = "./modules/virtual-machine"
  vm_name = "test04"
  ip_address = "10.0.0.5/24"
  gateway = "10.0.0.2"
}

module "test05" {
  source = "./modules/virtual-machine"
  vm_name = "test05"

  cores = 4
  memory = 4096

  disk_size = 25

  ip_address = "10.0.0.6/24"
  gateway = "10.0.0.2"
}
