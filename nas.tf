resource "alicloud_nas_file_system" "main" {
  protocol_type    = var.verify_nas.protocol_type
  storage_type     = var.verify_nas.storage_type
  file_system_type = var.verify_nas.file_system_type
  capacity         = var.verify_nas.capacity
  description      = var.verify_nas.description
  zone_id          = var.verify_nas.zone_id
  vpc_id           = data.alicloud_vpcs.main_vpc.vpcs.0.id
  vswitch_id       = data.alicloud_vswitches.main_switch.vswitches.0.id
}


resource "alicloud_nas_access_group" "main" {
  access_group_name = var.verify_nas_group.access_group_name
  access_group_type = var.verify_nas_group.access_group_type
  description       = var.verify_nas_group.description
}

resource "alicloud_nas_access_rule" "foo" {
  access_group_name = alicloud_nas_access_group.main.access_group_name
  source_cidr_ip    = var.verify_nas_group_rule.source_cidr_ip
  rw_access_type    = var.verify_nas_group_rule.rw_access_type
  user_access_type  = var.verify_nas_group_rule.user_access_type
}



resource "alicloud_nas_mount_target" "example" {
  depends_on        = [alicloud_nas_access_group.main]
  file_system_id    = alicloud_nas_file_system.main.id
  access_group_name = alicloud_nas_access_group.main.access_group_name
  vswitch_id        = data.alicloud_vswitches.main_switch.vswitches.0.id
}

