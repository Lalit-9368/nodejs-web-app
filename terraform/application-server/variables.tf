variable "ami-id" {
  type = string
}

variable "iam-instance-profile" {
  default = ""
  type = string
}

variable "instance-type" {
  type = string
  default = "t3.micro"
}

variable "name" {
  type = string
}

variable "key-pair" {
  type = string
}

variable "network-interface-id" {
  type = string
}

variable "device-index" {
  type = number
}

variable "repository-url" {
  type = string
}

variable "repository-test-url" {
  type    = string
  default = ""
}

variable "repository-staging-url" {
  type    = string
  default = ""
}

variable "bucket-logs-name" {
  type    = string
  default = ""
}

variable "admin-username" {
  type    = string
  default = ""
}

variable "admin-password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "admin-fullname" {
  type    = string
  default = ""
}

variable "admin-email" {
  type    = string
  default = ""
}

variable "remote-repo" {
  type    = string
  default = ""
}

variable "job-name" {
  type    = string
  default = ""
}

variable "job-id" {
  type    = string
  default = ""
}

variable "bucket-config-name" {
  type    = string
  default = ""
}
