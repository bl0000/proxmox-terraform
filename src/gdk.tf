## Disposable GitLab Development Kit (GDK) box for local security research.
## Scratch/throwaway — nothing important lives here, so its disk is excluded from backups.

module "gdk01" {
  source  = "./modules/virtual-machine"
  vm_name = "gdk01"

  ## Placement follows the module default (proxmox01). Override with
  ## node_name = "proxmox02" etc — node_name is in the module's ignore_changes,
  ## so moving the VM in Proxmox afterwards won't show up as drift either.

  cores  = 8
  memory = 16384

  disks = [
    {
      size         = 80
      datastore_id = "nvme-lvm"
      backup       = false ## Disposable — no backups
    }
  ]

  vlan_tag = 1009

  ip_address = "10.15.1.230/28"
  gateway    = "10.15.1.225"
}
