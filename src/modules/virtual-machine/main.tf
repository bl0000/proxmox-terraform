resource "proxmox_virtual_environment_vm" "vm" {
  name      = var.vm_name
  node_name = var.node_name

  clone {
    vm_id     = 106 # deb12-template
    node_name = "proxmox01" # template only lives here — required for cross-node clones
  }

  agent {
    enabled = true # Qemu
    trim    = true # FSTRIM on VM migration
    type = "virtio"
  }

  cpu {
    cores = var.cores
    type  = "x86-64-v3"
  }

  memory {
    dedicated = var.memory
    floating  = var.memory # Enables ballooning
  }

  dynamic "disk" {
    for_each = var.disks
    content {
      interface    = "scsi${disk.key}" # Auto-increment scsi0, scsi1 etc
      size         = disk.value.size
      datastore_id = lookup(disk.value, "datastore_id", "nvme-lvm")
      backup       = disk.value.backup
      cache        = disk.value.cache
      discard      = disk.value.discard
      iothread     = disk.value.iothread
      replicate    = disk.value.replicate
    }
  }

  network_device {
    vlan_id = var.vlan_tag
  }

  initialization {
    datastore_id = "local-lvm" # Pin explicitly: provider default drifts in/out of state across versions

    dns {
      servers = var.dns_servers
    }

    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }

    user_account {
      username = "ben"
      keys     = [var.ssh_key]
    }
  }

  lifecycle {
    ignore_changes = [
      node_name,
      started,
      clone
    ]
  }
}
