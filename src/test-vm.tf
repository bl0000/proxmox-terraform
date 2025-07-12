resource "proxmox_virtual_environment_vm" "test01" {
  name      = "test01"
  node_name = "proxmox01"

  clone {
    vm_id = 104 # debian12-template
  }

  agent {
    enabled = true # Qemu
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
        address = "10.0.0.11/24"
        gateway = "10.0.0.2"
      }
    }

    user_account {
      username = "ben"
      keys = [var.ssh_key]
    }
  }
}
