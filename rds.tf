resource "alicloud_kms_key" "key" {
  description             = "RDS KMS"
  pending_window_in_days  = "7"
  status                  = "Enabled"
}

resource "alicloud_kms_alias" "this" {
  alias_name = "alias/rds_kms"
  key_id     = alicloud_kms_key.key.id
}

resource "alicloud_db_instance" "main" {
  instance_name = var.verify_rds.instance_name
  zone_id       = var.verify_rds.zone_id
  vswitch_id    = data.alicloud_vswitches.main_switch.vswitches.0.id
  instance_type  = var.verify_rds.instance_type
  security_group_ids = [alicloud_security_group.group.id]
  instance_storage   = var.verify_rds.instance_storage
  engine             = var.verify_rds.engine
  engine_version       = var.verify_rds.engine_version
  db_instance_storage_type  = var.verify_rds.db_instance_storage_type
  encryption_key   = alicloud_kms_key.key.id
  instance_charge_type  = var.verify_rds.instance_charge_type
  period  = var.verify_period_rds
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


resource "alicloud_db_account" "account" {
  db_instance_id = alicloud_db_instance.main.id
  account_name        = var.verify_rds_account.name
  account_password    = var.verify_rds_account.password
  account_type = var.verify_rds_account.type
}