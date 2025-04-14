output "this_ons_id" {
  description = "The ID of the ONS instance."
  value       = alicloud_ons_instance.default.id
}

output "this_ons_name" {
  description = "The name of the ONS instance."
  value       = alicloud_ons_instance.default.instance_name
}

output "this_redis_name" {
  description = "The name of the Redis instance."
  value       = alicloud_kvstore_instance.default.db_instance_name
}
