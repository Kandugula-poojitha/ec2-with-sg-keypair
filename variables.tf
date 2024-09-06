variable "instance_type" {
  description = "Value of the instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}
variable "access_key" {
  description = "Value of the access key"
  type        = string
  
}
variable "secret_key" {
  description = "Value of the secret key"
  type        = string
  
}
variable "ami-id" {
  description = "Value of the ami id for the EC2 instance"
  type        = string
  default = "ami-xxxxxxxxxxxxxxxx"
}