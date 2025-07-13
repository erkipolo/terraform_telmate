resource "proxmox_lxc" "stage-ct" {
  count           = var.stage_ct_count
  cores           = 2
  memory          = 512
  swap            = 512
  onboot          = true
  hostname        = "stage-ct-${var.stage_ct_initial_id + count.index + 1}"
  nameserver      = var.dns_servers
  ostemplate      = "local:vztmpl/${var.ostemplate}"
  password        = var.root_pass
  searchdomain    = var.search_domain
  ssh_public_keys = var.ansible_ssh_public_key
  start           = true
  target_node     = var.node_name
  unprivileged    = true
  vmid            = var.stage_ct_initial_id + count.index + 1
  features {
    nesting = true
  }
  network {
    bridge   = "vmbr0"
    firewall = true
    gw       = "${var.private_subnet}1"
    ip       = "${var.private_subnet}${var.initial_ip + count.index + 1}${var.private_subnet_mask}"
    name     = "eth0"
  }
  rootfs {
    size    = "2G"
    storage = "local-lvm"
  }
}
