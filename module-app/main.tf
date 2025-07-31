module "dev-infra" {
  source = "./infra-app"
  env = "dev"
  bucket_name = "abi-infra-app-bucket"
  instance_count = 1
  instance_type = "t2.small"
  ec2_ami_id = "ami-08a6efd148b1f7504"
  hash_key = "studentId"
  
}
module "prod-infra" {
  source = "./infra-app"
  env = "prod"
  bucket_name = "abi-infra-app-bucket"
  instance_count = 2
  instance_type = "t2.medium"
  ec2_ami_id = "ami-08a6efd148b1f7504"
  hash_key = "studentId"
  
}
module "stag-infra" {
  source = "./infra-app"
  env = "staging"
  bucket_name = "abi-infra-app-bucket"
  instance_count = 1
  instance_type = "t2.micro"
  ec2_ami_id = "ami-08a6efd148b1f7504"
  hash_key = "studentId"
  


}