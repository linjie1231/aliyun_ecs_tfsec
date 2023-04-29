#模块目录
module "aliyun_cloud_monitor" {
  source = "git::https://gitee.com/zlchen199/aliyun_monitor_terraform.git"  #模块地址

  contact_group_name = "contact_group_name_from_infra_sample"  #资源组名称

  target_account_id = "1454646797648269"  #验证id
  #告警联系人
  first_contact = {
    mail = "test_aliyun_alarm_1@test.com"
    sms  = "12388888888"
    lang = "zh-cn"
  }
  second_contact = {
    mail = "test_aliyun_alarm_2@test.com"
    sms  = "12388888888"
    lang = "zh-cn"
  }
}
