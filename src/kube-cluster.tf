module "kube01" {
  source  = "./modules/virtual-machine"
  vm_name = "kube01"

  cores  = 2
  memory = 6144

  disks = [
    {
      size = 40
      datastore_id = "nvme-lvm"
    },
    {
      size = 50
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1008

  ip_address = "10.15.1.210/28"
  gateway    = "10.15.1.209"
}

module "kube02" {
  source  = "./modules/virtual-machine"
  vm_name = "kube02"

  cores  = 2
  memory = 6144

  disks = [
    {
      size = 40
      datastore_id = "nvme-lvm"
    },
    {
      size = 50
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1008

  ip_address = "10.15.1.211/28"
  gateway    = "10.15.1.209"
}

module "kube03" {
  source  = "./modules/virtual-machine"
  vm_name = "kube03"

  cores  = 2
  memory = 6144

  disks = [
    {
      size = 40
      datastore_id = "nvme-lvm"
    },
    {
      size = 50
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1008

  ip_address = "10.15.1.212/28"
  gateway    = "10.15.1.209"
}

module "kube04" {
  source  = "./modules/virtual-machine"
  vm_name = "kube04"

  cores  = 4
  memory = 8192

  disks = [
    {
      size = 60
      datastore_id = "nvme-lvm"
    },
    {
      size = 100
      datastore_id = "nvme-lvm"
    }
  ]

  vlan_tag = 1008

  ip_address = "10.15.1.213/28"
  gateway    = "10.15.1.209"
}