module "test04" {
  source = "./modules/virtual-machine"
  vm_name = "test04"
  ip_address = "10.0.0.5"
  gateway = "10.0.0.2"
}
