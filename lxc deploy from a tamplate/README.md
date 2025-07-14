## Description
**Creating Debian instances on Proxmox with Terraform using Telmate provider**

## Goal
![Logo](Objetivo.png)

## Autor
* [Erki Polo Manresa](https://linkedin.com/in/erkipolo)

## To see how get to the solution
* [Youtube link coming soon](Próximamente)

## Requirements
- Proxmox installed
- A token user from Proxmox
- A Debian container template inside local storage
  - version = standard_12.7-1_amd64 (it's a variable)
- Terraform installed
- An internet connection

## issues
- Even though the public key is passed, root access via SSH is not enabled. You have to physically enter the server and modify the service or create a user.
  - Solution: Deploy a template with "Cloud-Init" installed and use the "clone" function of Telmate's "proxmox_lxc" resource.
