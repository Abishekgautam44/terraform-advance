#!/bin/bash

sudo yum update
sudo yum install nginx -y
sudo systemctl enable --now nginx
echo "<h1> Learning Terraform | Abishek Gautam </h1>" | sudo tee /usr/share/nginx/html/index.html > /dev/null
