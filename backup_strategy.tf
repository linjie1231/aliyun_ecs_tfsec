resource "alicloud_ecs_auto_snapshot_policy" "main" {
    name            = var.verify_ecs_backup.name
    repeat_weekdays = var.verify_ecs_backup.repeat_weekdays
    retention_days  = var.verify_ecs_backup.retention_days
    time_points     = var.verify_ecs_backup.time_points
}


resource "alicloud_db_backup_policy" "main" {
    instance_id = alicloud_db_instance.main.id
    preferred_backup_period  = var.verify_rds_backup.preferred_backup_period
    preferred_backup_time =  var.verify_rds_backup.preferred_backup_time
    backup_retention_period  = var.verify_rds_backup.backup_retention_period
    enable_backup_log = var.verify_rds_backup.enable_backup_log
    log_backup_retention_period = var.verify_rds_backup.log_backup_retention_period
}


resource "alicloud_nas_auto_snapshot_policy" "main" {
  auto_snapshot_policy_name = var.verify_nas_backup.auto_snapshot_policy_name
  repeat_weekdays           = var.verify_nas_backup.repeat_weekdays
  retention_days            = var.verify_nas_backup.retention_days
  time_points               = var.verify_nas_backup.time_points
}