variable "vpc_id"            { type = string }
variable "public_subnet_ids" { type = list(string) }
variable "environment"       { type = string }
variable "instance_type" {
  type    = string
  default = "t3.micro"
}
variable "allowed_ssh_cidr"  { type = string }
variable "ssh_key_name"      { type = string }
