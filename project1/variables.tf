variable "private_key_path"{

  type = string

  default = "./harika_terraform.pem"

}

variable "key_name" {

  type = string

  description = "key name"

  default = "harika_terraform"

}
