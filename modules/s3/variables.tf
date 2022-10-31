variable "create_bucket" {
  type = bool
  default = false
}

variable "bucket" {
  type = string
  default = "my-bucket" 
}

variable "acl" {
  type = string
  default = "private"
}

variable "policy" {
  type = string
  default = ""
}

variable "attach_policy" {
  type = bool
  default = false
}

variable "versioning" {
  type = map
  default = {
    enabled = true
  }
}

variable "object_lock_enabled" {
  type = bool
  default = false
}