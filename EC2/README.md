

#  Terraform AWS EC2 Deployment

This repository contains Terraform configuration files to **provision an Amazon EC2 instance** along with a security group and key pair using AWS as the provider.

## 📁 Project Structure

```


├── ec2.tf               # EC2 instance, key pair, VPC, and security group

├── provider.tf          # AWS provider configuration

├── terraform.tf         # Optional Terraform config file (backend, etc.)

├── terraform.tfstate\*   # Terraform state files

├── terra-key-ec2        # Private SSH key (do NOT upload to GitHub)

├── terra-key-ec2.pub    # Public SSH key used for EC2 key pair

├── README.md            # Project documentation

```


## Features

- Creates a **key pair** (`terra_key_ec2`)
- Uses the **default VPC**
- Creates a **security group** with:
  - Port 22 open for SSH
  - Port 80 open for HTTP
  - Port 8000 open for custom Flask app
- Launches a **t2.micro EC2 instance** using **Amazon Linux 2**
- Attaches a 15GB `gp3` EBS root volume



## Requirements

- Terraform ≥ 1.0
- AWS CLI configured with access keys
- An AWS account
- A public SSH key file (`terra-key-ec2.pub`)



## Usage

1. **Clone this repo**:
   ```bash
   git clone https://github.com/yourusername/terraform-ec2-demo.git
   cd terraform-ec2-demo


2. **Generate SSH key (if not already)**:

   ```bash
   ssh-keygen -t rsa -b 4096 -f terra-key-ec2
   ```

3. **Initialize Terraform**:

   ```bash
   terraform init
   ```

4. **Preview the plan**:

   ```bash
   terraform plan
   ```

5. **Apply the configuration**:

   ```bash
   terraform apply
   ```

6. **Access your instance**:

   ```bash
   ssh -i terra-key-ec2 ec2-user@<EC2_PUBLIC_IP>
   ```

---
## importing resources to terrafrom state from aws

``` bash
## make a new resource on main.tf with dummy data
resource "aws_instance" "my_new_instancee" {
   ami = "Unknown"
   instance_type = "unknown" 
}
 
 bash
 terraform import aws_instance.my_new_instance <Instance-id>

## or import uisng import  block
 import{
   to = aws_key_pair.developer
   id = "developer-key"
 }

```

## Terraform State Management
``` bash
terraform state list
terraform state show <list_item>
terraform state rm aws_key_pair.my_key
terrafrom import aws_key_pair.my_key <key-pair_id_from_aws>

```
we can't keep the terraform.tfsate file on github and s3 alone so we use s3 with DynamoDB to lock the file while someone is accessing it inorder to avoid state conflict.

we used the remote backend to send the terraform state file to the s3 bucket and sync with them.

only if someuser completes the terraform state management only then, others will be able to change the terraform state or configuration files.




## Cleanup

To destroy all created resources:

```bash
terraform destroy
```

---

## Security Note

* Do **not** commit the private key (`terra-key-ec2`) to GitHub.
* Always use `.gitignore` to exclude sensitive files:

  ```
  .terraform/
  terraform.tfstate*
  terra-key-ec2
  ```

---

## Author

**Abishek Gautam**
Feel free to reach out or fork this repo and customize it for your own needs!

---




