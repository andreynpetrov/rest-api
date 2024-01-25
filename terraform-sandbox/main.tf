resource "random_pet" "this" {
  count     = var.enabled == true ? 1 : 0
  length    = var.length
  separator = var.separator
  prefix    = local.prefix
  keepers = {
    prefix = local.prefix
  }
}
