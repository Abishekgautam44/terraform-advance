variable "env" {
    description = "This is the environment"
    type = string
  
}
variable "bucket_name" {
   description = "This is my bucket name"
    type = string
}

variable "instance_count" {
   description = "Total number of instances"
   type = number
}

variable "instance_type" {
    description = "Intance Type"
    type = string
}

 variable "ec2_ami_id" {
   description = "this ami is used for instnce creation"
   type = string
 }
variable "hash_key" {
  description = "This is the hash key for dyanamo infra"
  type = string
}
