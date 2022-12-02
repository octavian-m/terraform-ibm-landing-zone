##############################################################################
# Landing Zone VSI Pattern
##############################################################################

module "landing_zone" {
  source           = "../../patterns/vsi"
  prefix           = var.prefix
  region           = var.region
  ibmcloud_api_key = var.ibmcloud_api_key
  ssh_public_key   = var.ssh_key
  override         = true
  tags             = var.resource_tags
  #resource_group_id           = var.resource_group
}

module "install-prereq" {
  source     = "./modules/install-prereq"
  depends_on = [module.landing_zone]
  IP              = module.landing_zone.fip_vsi[0].floating_ip
  private_ssh_key = var.private_ssh_key
}