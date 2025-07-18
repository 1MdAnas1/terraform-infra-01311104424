variable "custom_port" {
  description = "Custom port to allow inbound traffic on"
  type        = number
  default     = 8080
}

variable "key_name" {
  description = "Name of the AWS EC2 key pair"
  type        = string
}
