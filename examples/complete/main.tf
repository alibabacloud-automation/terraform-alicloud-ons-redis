data "alicloud_zones" "default" {
  available_resource_creation = "KVStore"
}

data "alicloud_resource_manager_resource_groups" "default" {
}

data "alicloud_kvstore_instance_classes" "default" {
  zone_id        = data.alicloud_zones.default.zones.0.id
  engine         = "Redis"
  engine_version = var.redis_engine_version
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}

resource "random_integer" "default" {
  max = 99999
  min = 10000
}

module "example" {
  source = "../.."

  #alicloud_ons_instance
  name        = "${var.name}-${random_integer.default.result}"
  description = var.description

  #alicloud_kvstore_instance
  vswitch_id                   = module.vpc.this_vswitch_ids[0]
  availability_zone            = data.alicloud_zones.default.zones.0.id
  security_ips                 = var.security_ips
  redis_engine_version         = var.redis_engine_version
  redis_appendonly             = var.redis_appendonly
  redis_lazyfree_lazy_eviction = var.redis_lazyfree_lazy_eviction
  redis_resource_group_id      = data.alicloud_resource_manager_resource_groups.default.ids.0
  redis_instance_class         = data.alicloud_kvstore_instance_classes.default.instance_classes.0

}