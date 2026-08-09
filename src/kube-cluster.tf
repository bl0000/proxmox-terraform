module "kube01" {
  source  = "./modules/virtual-machine"
  vm_name = "kube01"

  cores  = 2
  memory = 6144

  disks = [
    {
      size = 30
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
      size = 30
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
      size = 30
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

  # Dedicated Wazuh node. proxmox02 has the most free RAM of the 3 online
  # hosts (kube01-03 are already near their 6GB memory ceiling), but it also
  # hosts mc02 (12GB), so 8GB keeps the host within its 31GB budget when both
  # are running.
  node_name = "proxmox02"

  cores  = 4
  memory = 8192

  disks = [
    {
      size = 30
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