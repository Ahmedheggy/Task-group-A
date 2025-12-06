variable "instance_ids" {
  description = "List of EC2 instance IDs to monitor"
  type        = list(string)
}

variable "email" {
  description = "Email address for SNS notifications"
  type        = string
}
