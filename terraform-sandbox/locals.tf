locals {
  prefix = join(var.separator, [var.environment, data.aws_region.this.name, var.cluster])
}
