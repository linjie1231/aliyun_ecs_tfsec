resource "alicloud_instance" "CNAL1LXWFT401" {
  availability_zone          = var.verify_ecs.availability_zone
  security_groups            = [alicloud_security_group.group.id]
  instance_type              = var.verify_ecs.instance_type
  system_disk_category       = var.verify_ecs.system_disk_category
  system_disk_name           = var.verify_ecs.system_disk_name
  system_disk_description    = var.verify_ecs.system_disk_description
  system_disk_size           = var.verify_ecs.system_disk_size
  image_id                   = var.verify_ecs.image_id
  instance_name              = var.verify_ecs.instance_name
  vswitch_id                 = data.alicloud_vswitches.main_switch.vswitches.0.id
  password                   = var.verify_ecs.password
  internet_charge_type       = var.verify_ecs.internet_charge_type
  host_name                  = var.verify_ecs.host_name
  period_unit                = var.verify_ecs.period_unit
  period                     = var.verify_period
  instance_charge_type       = var.verify_ecs.instance_charge_type
  private_ip                 = var.verify_ecs.private_ip
  tags {
    APPLICATION-NAME = "WFT-OTC"
    CMDB_APPLICATION_INSTANCE_ID = "INST_2021_11_26_7_35_46_8941001"
    REGION = "SHANGHAI"
    AZ = "B"
    ENVIRONMENT = "DEVELOPMENT"
    RESOURCE-OWNER = "angus.lai@kone.com"
    INVENTORY-COST-CENTER = "KCCG316"
    CHARGING-COST-CENTER = "KCC5203 "
  }
}


resource "alicloud_instance" "CNAL1LXWFT402" {
  availability_zone          = var.verify_ecs02.availability_zone
  security_groups            = [alicloud_security_group.group.id]
  instance_type              = var.verify_ecs02.instance_type
  system_disk_category       = var.verify_ecs02.system_disk_category
  system_disk_name           = var.verify_ecs02.system_disk_name
  system_disk_description    = var.verify_ecs02.system_disk_description
  system_disk_size           = var.verify_ecs02.system_disk_size
  image_id                   = var.verify_ecs02.image_id
  instance_name              = var.verify_ecs02.instance_name
  vswitch_id                 = data.alicloud_vswitches.main_switch.vswitches.0.id
  password                   = var.verify_ecs02.password
  internet_charge_type       = var.verify_ecs02.internet_charge_type
  host_name                  = var.verify_ecs02.host_name
  period_unit                = var.verify_ecs02.period_unit
  period                     = var.verify_period
  instance_charge_type       = var.verify_ecs02.instance_charge_type
  private_ip                 = var.verify_ecs02.private_ip
  tags {
    APPLICATION-NAME = "WFT-OTC"
    CMDB_APPLICATION_INSTANCE_ID = "INST_2021_11_26_7_35_46_8941001"
    REGION = "SHANGHAI"
    AZ = "B"
    ENVIRONMENT = "DEVELOPMENT"
    RESOURCE-OWNER = "angus.lai@kone.com"
    INVENTORY-COST-CENTER = "KCCG316"
    CHARGING-COST-CENTER = "KCC5203 "
  }
}

