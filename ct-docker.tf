variable "ct_docker_count" {
  type    = number
  default = 0
}
variable "ct_docker_ip_init" {
  type    = number
  default = 109
}
resource "proxmox_lxc" "ct-docker" {
  count           = var.ct_docker_count
  target_node     = var.ct_target_node
  hostname        = "ct-docker-${count.index + 1}"
  ostemplate      = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  unprivileged    = true
  onboot          = true
  start           = true
  password        = var.ct_root_pass
  ssh_public_keys = var.ct_ssh_public_key
  vmid            = var.ct_docker_ip_init + count.index + 1
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
  network {
    name   = "eth0"
    bridge = "vmbr0"
    gw     = "192.168.56.1"
    ip     = "192.168.56.${var.ct_docker_ip_init + count.index + 1}/24"
  }
}
