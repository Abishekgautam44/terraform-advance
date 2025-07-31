# key pair
resource "aws_key_pair" "my_key" {
  key_name   = "terra_key_ec2"
  public_key = file("terra-key-ec2.pub")
}

# vpc and security group
resource "aws_default_vpc" "default" {

}
resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "this will add a TF generated security group"
  vpc_id      = aws_default_vpc.default.id #interpolation

  #inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Open port for http"
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "flask app"
  }


  #outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open outbound"
  }

  tags = {
    Name = "automate-sg"
  }

}

# ec2_instance



resource "aws_instance" "abi_server" {

#count=3 #creating three intances of identical 
#OR

  for_each = tomap({
    "server-automate-micro" = "t2.micro"
    "server-automate-medium" = "t2.medium"

  }) #meta argument
  depends_on = [ aws_security_group.my_security_group, aws_key_pair.my_key ]

  #change the instance_type and tags value using each

  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = each.value
  ami             = var.ec2_ami_id
  user_data = file("install_nginx.sh")

  root_block_device {
    volume_size = var.env == "prod" ? 20 : var.ebs_storge_size # conditional expression
    volume_type = "gp3"
  }
  tags = {
    Name = each.key
    Environment = var.env
  }

}   