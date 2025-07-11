resource "proxmox_virtual_environment_vm" "ubuntu_clone" {
  name      = "test01"
  node_name = "proxmox01"

  clone {
    vm_id = 104 # debian12-template
  }

  agent {
    enabled = true
  }

  memory {
    dedicated = 2048
  }

  initialization {
    dns {
      servers = ["1.1.1.1"]
    }
    ip_config {
      ipv4 {
        address = "10.0.0.10"
        gateway = "10.0.0.2"
      }
    }
  }
}
