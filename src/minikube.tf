module "minikube01" {
  source  = "./modules/virtual-machine"
  vm_name = "minikube01"

  cores  = 2
  memory = 4096

  disks = [
    {
      size = 25
    }
  ]

  vlan_tag = 1008

  ip_address = "10.15.1.213/28"
  gateway    = "10.15.1.209"
}