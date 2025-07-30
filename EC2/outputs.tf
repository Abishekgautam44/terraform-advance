# output "ec2_public_ip" {
#   value = aws_instance.abi_server.public_ip #single output
#   #value = aws_instance.abi_server[*].public_ip # Multiple outputs  >> count
# }

# output "ec2_public_dns" {
#     value = aws_instance.abi_server.public_dns
#     #value = aws_instance.abi_server[*].public_dns # >> count
  
# }
# output "ec2_private_ip" {
#     value = aws_instance.abi_server.private_ip # single output
#     #value = aws_instance.abi_server[*].private-ip  Mulitple outputs >> count
  
# }

output "ec2_public_ip" {
  value = {
    for key, inst in aws_instance.abi_server : key => inst.public_ip
  }
}

#Terraform does this:
#On the first iteration: key = "server-1", inst = aws_instance.abi_server["server-1"]
#On the second iteration: key = "server-2", inst = aws_instance.abi_server["server-2"]
#: “For each EC2 instance in the map, take its key and map it to its private IP

output "ec2_private_ip" {
  value = [
    for instance in aws_instance.abi_server : instance.private_ip
  ]
}

output "ec2_public_dns" {
  value = [
    for instance in aws_instance.abi_server : instance.public_dns
  ]
}

