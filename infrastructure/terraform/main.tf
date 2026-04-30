# TODO: Construct the Terraform script to provision a Hetzner server 
terraform {
  cloud {
    organization = "StarlinerDev"  # TODO: change to your own TF Cloud org
    workspaces {
      name = "workshop" # TODO: change your workspace name
    }
  }

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.57"
    }
  }
}
provider "hcloud" {
	token = var.hcloud_token
}
resource "hcloud_ssh_key" "default" {
	# TODO: Give a unique name (e.g. key-<your-name>) to avoid conflict
  name       = "workshop-terraform-key"
  public_key = var.ssh_public_key
}
output "csee_server_ip" {
  value = hcloud_server.csee_server.ipv4_address
}