variable "ec2_instance_type" {  
    default = "t2.micro"
    type = string
}
variable "ec2_ami_id" {
    default = "ami-08a6efd148b1f7504"
    type = string
}

variable "ebs_storge_size" {
  default = 10
  type = number
} 

variable "env" {
  default = "prod"
  type = string
}