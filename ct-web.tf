variable "ct_web_count" {
  type    = number
  default = 1
}
variable "ct_web_ip_init" {
  type    = number
  default = 100
}
resource "proxmox_lxc" "ct-web" {
  count           = var.ct_web_count
  target_node     = var.ct_target_node
  hostname        = "ct-web-${count.index + 1}"
  ostemplate      = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  unprivileged    = true
  onboot          = true
  start           = true
  password        = var.ct_root_pass
  ssh_public_keys = var.ct_ssh_public_key
  vmid            = var.ct_web_ip_init + count.index + 1
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
  network {
    name   = "eth0"
    bridge = "vmbr0"
    gw     = "192.168.56.1"
    ip     = "192.168.56.${var.ct_web_ip_init + count.index + 1}/24"
  }
}
