#terraform conf
variable "verify_key" {
  type = map(string)
  default = {
    region     = "cn-shanghai"
    access_key = "LTAI5tNRDBJ9AoXqWrUhi6f7"
    secret_key = "fjJp4cnCun0qFibtUPmREZrmMWxAfW"
  }
}

#ram
variable "verify_role" {
  type = map(string)
  default = {
    role_name   = "Iac-manager-WFT"
    policy_type = "System"
    policy_name = "AdministratorAccess"
  }
}


# select vpc ip
variable "verify_vpc_ip" {
  type = map(string)
  default = {
    cidr_block =  "10.0.0.0/8"
  }
}

# select switch ip
variable "verify_switch_ip" {
  type = map(string)
  default = {
    cidr_block = "10.1.2.0/24"
  }
}

# select nat
variable "verify_select_nat" {
  type = map(string)
  default = {
    name = "NAT_Gateway"
  }
}


#router private
variable "verify_router_private" {
  type = map(string)
  default = {
    name = "WFT-DEV-PRIVATE-ROUTER"
  }
}

#router public
variable "verify_router_public" {
  type = map(string)
  default = {
    name = "WFT-DEV-PUBLIC-ROUTER"
  }
}

#router
variable "verify_router" {
  type = map(string)
  default = {
    destination_cidrblock = "0.0.0.0/0"
    nexthop_type = "Attachment"
    nexthop_id = "tr-attach-lfk0vegphqi1xgazr2"
  }
}


#security group
variable "verify_security_group" {
  type = map(string)
  default = {
    name = "WFT-SG-DEV-SHL-AL1"
    description = "WFT-SG-DEV-SHL-AL1"
  }
}


#ecs
variable "verify_ecs" {
  type = map(string)
  default = {
    instance_type = "ecs.s6-c1m4.xlarge"
    system_disk_category = "cloud_essd"
    system_disk_name = "WFT-DISK-DEV-SHL-AL1"
    system_disk_description    = "WFT-DISK-DEV-SHL-AL1"
    system_disk_size           = "150"
    image_id                   = "m-uf6begmi5iraygkx1itr"
    instance_name              = "CNAL1LXWFT401"
    availability_zone          = "cn-shanghai-b"
    password                   = "I8dznVEABh9HhKpPnc4="
    internet_charge_type       = "PayByTraffic"
    instance_charge_type       = "PrePaid"
    host_name                  = "CNAL1LXWFT401"
    period_unit                = "Month"
    private_ip                 = "10.1.2.10"
  }
}

#ecs
variable "verify_ecs02" {
  type = map(string)
  default = {
    instance_type = "ecs.s6-c1m4.small"
    system_disk_category = "cloud_essd"
    system_disk_name = "WFT-DISK-DEV-SHL-AL2"
    system_disk_description    = "WFT-DISK-DEV-SHL-AL2"
    system_disk_size           = "150"
    image_id                   = "m-uf6begmi5iraygkx1itr"
    instance_name              = "CNAL1LXWFT402"
    availability_zone          = "cn-shanghai-b"
    password                   = "I8dznVEABh9HhKpPnc4="
    internet_charge_type       = "PayByTraffic"
    instance_charge_type       = "PrePaid"
    host_name                  = "CNAL1LXWFT402"
    period_unit                = "Month"
    private_ip                 = "10.1.2.11"
  }
}


#ecs period
variable "verify_period" {
  type = number
  default = 12
}


#rds
variable "verify_rds" {
  type = map(string)
  default = {
    instance_name = "WFT-RDS-DEV-SHL-AL1"
    zone_id       = "cn-shanghai-b"
    instance_type = "mysql.n4.medium.2c"
    instance_storage = "200"
    engine       = "MySQL"
    engine_version = "8.0"
    db_instance_storage_type = "cloud_essd"
    instance_charge_type       = "Prepaid"
  }
}

#rds period
variable "verify_period_rds" {
  type = number
  default = 12
}


#rds account
variable "verify_rds_account" {
  type = map(string)
  default = {
    name = "rds_admin_account"
    password = "ki2+iItFPRSg8zK6ExU="
    type = "Super"
  }
}


#nas
variable "verify_nas" {
  type = map(string)
  default = {
      protocol_type    = "NFS"
      storage_type     = "Performance"
      file_system_type = "standard"
      capacity         = "3600"
      description      = "WFT-NAS-DEV-SHL-AL1"
      zone_id          = "cn-shanghai-b"
    }
}

#nas group
variable "verify_nas_group" {
  type = map(string)
  default = {
      access_group_name = "WFT-NASG-DEV-SHL-AL1"
      access_group_type = "Vpc"
      description       = "WFT-NASG-DEV-SHL-AL1"
    }
}

#nas group rule
variable "verify_nas_group_rule" {
  type = map(string)
  default = {
        source_cidr_ip    = "0.0.0.0/0"
        rw_access_type    = "RDWR"
        user_access_type  = "no_squash"
    }
}


#alb
variable "verify_alb" {
  type = map(string)
  default = {
        address_type           = "Intranet"
        address_allocated_mode = "Fixed"
        load_balancer_name     = "WFT-ALB-DEV-SHL-AL1"
        load_balancer_edition  = "Basic"
        pay_type = "PayAsYouGo"
        vswitch_id_01 = "vsw-uf6cqwkyhjrh0hmtgehgl"
        zone_id_01    = "cn-shanghai-e"
        vswitch_id_02 = "vsw-uf6x3dbj3hf2a5i4e0npv"
        zone_id_02    = "cn-shanghai-g"
    }
}


#alb server group
variable "verify_alb_server_group" {
  type = map(string)
  default = {
        protocol = "HTTPS"
        health_check_enabled = "false"
        sticky_session_enabled = "false"
    }
}

#alb server group port
variable "alb_server_group_port" {
  type        = list(number)
  default     = [443,8999,7070]
}



#clb
variable "verify_clb" {
  type = map(string)
  default = {
      load_balancer_name     = "WFT-CLB-DEV-SHL-AL1"
      address_type   = "intranet"
      load_balancer_spec = "slb.s2.small"
      master_zone_id     = "cn-shanghai-b"
      slave_zone_id      = "cn-shanghai-d"
      payment_type       = "Subscription"
      period            = "12"
    }
}

#clb server group
variable "verify_clb_server_group" {
  type = map(string)
  default = {
      name = "WFT-CLBG-DEV-SHL-AL1"
      port = "5222"
      weight  = "10"
      protocol  = "tcp"
      scheduler  = "rr"
    }
}


#waf domain
variable "verify_waf" {
  type = map(string)
  default = {
      domain            = "www.aliyun.com"
      instance_id       = "waf-TF"
      is_access_product = "On"
      cluster_type      = "PhysicalCluster"
      http_to_user_ip   = "Off"
      https_redirect    = "Off"
      load_balancing    = "IpHash"
      log_key           = "waf-tf"
      log_value         = "http"

    }
}

#waf port
variable "verify_waf_port" {
    type        = object({
    source_ips      = list(string)
    http_port       = list(number)
    https_port      = list(number)
  })
  default     = {
    source_ips = ["1.1.1.1"]
    http_port   = [80]
    https_port   = [443]
  }
}


#cfw
variable "verify_cfw" {
  type = map(string)
  default = {
      application_name = "ANY"
      acl_action       = "accept"
      description      = "CFW-TF"
      destination_type = "net"
      destination      = "100.1.1.0/24"
      direction        = "out"
      proto            = "ANY"
      source           = "1.2.3.0/24"
      source_type      = "net"
    }
}

#ecs backup strategy
variable "verify_ecs_backup" {
    type        = object({
    name            = string
    repeat_weekdays      = list(string)
    retention_days       = number
    time_points      = list(string)
  })
  default     = {
    name            = "WFT-SS-DEV-SHL-AL1"
    repeat_weekdays = ["1", "2", "3", "4", "5", "6", "7"]
    retention_days  = 30
    time_points     = ["3", "4"]
  }
}


#rds backup strategy

variable "verify_rds_backup" {
    type        = object({
    preferred_backup_period            = list(string)
    preferred_backup_time      = string
    backup_retention_period       = number
    enable_backup_log      = bool
    log_backup_retention_period = number
  })
  default     = {
    preferred_backup_period  = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    preferred_backup_time =  "02:00Z-03:00Z"
    backup_retention_period  = 14
    enable_backup_log = true
    log_backup_retention_period = 14
  }
}

#nas backup strategy
variable "verify_nas_backup" {
    type        = object({
    auto_snapshot_policy_name            = string
    repeat_weekdays      = list(string)
    retention_days       = number
    time_points      = list(string)
  })
  default     = {
    auto_snapshot_policy_name = "WFT-NASBK-DEV-SHL-AL1"
    repeat_weekdays           = ["1", "2", "3", "4", "5", "6", "7"]
    retention_days            = 30
    time_points               = ["3", "4"]
  }
}


