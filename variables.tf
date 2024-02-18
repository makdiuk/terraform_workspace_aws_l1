variable "region" {
  description = "The AWS Region where the Resource should exist"
  type        = string
  default     = "west-us-2"
}

variable "team" {
  description = "The AWS team that owns the resource"
  type        = string
  default     = "devops"
}
