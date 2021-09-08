variable "name" {
  default = "terraform_test"
}

data "alicloud_zones" "default" {
  available_resource_creation = "KVStore"
  enable_details              = true
}

resource "alicloud_vpc" "default" {
  vpc_name   = "terraform_test"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = "terraform_test"
  cidr_block   = "172.16.0.0/16"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name   = "terraform_test"
  vpc_id = alicloud_vpc.default.id
}

module "example" {
  source             = "../"
  name               = var.name
  vswitch_id         = alicloud_vswitch.default.id
  security_group_ids = [alicloud_security_group.default.id]
  availability_zone  = data.alicloud_zones.default.zones.0.id
}
