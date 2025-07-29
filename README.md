
# Terraform Advanced Configurations

This repository contains a collection of advanced Terraform configurations for deploying and managing various AWS services like **EC2**, **S3**, **RDS**, **EKS**, and more.

Each service has its own **isolated subdirectory** with configuration files and documentation.

---

## 📁 Project Structure

```

terraform-advanced/
├── EC2/       # EC2 instance setup with key pair and security group
├── S3/        # (Coming soon) S3 bucket creation, versioning, policies
├── RDS/       # (Coming soon) RDS database provisioning and security
├── EKS/       # (Coming soon) EKS cluster setup and node groups
├── .gitignore
├── .terraform.lock.hcl
└── README.md  # You're here

````

---

## What's Inside Each Module Directory?

Each subdirectory (e.g. `EC2/`, `RDS/`) includes:

- **Terraform configuration files** (`*.tf`)
- A dedicated **`provider.tf`** if needed
- Module-specific **`README.md`** with usage instructions
- Optional state-specific files (usually git-ignored)
- Optional key files or scripts (e.g. SSH keys, user data)

---

##  How to Use

Navigate into a specific module directory and run Terraform commands there:

```bash
cd EC2  # or S3, RDS, EKS, etc.

terraform init
terraform plan
terraform apply
````

Each module is **self-contained** and can be executed independently.

---

## Best Practices Followed

* Modular and service-separated architecture
* Sensitive files are excluded using `.gitignore`
* Each service directory has a clear scope and documentation
* Separate key pairs and state management per module (if needed)

---

## Security Notes

* **Do not commit private keys** or `.tfstate` files to version control
* Ensure `.gitignore` includes sensitive patterns:

  ```gitignore
  .terraform/
  *.tfstate
  *.tfstate.backup
  *.pem
  terra-key-*
  ```



---

## Author

**Abishek Gautam**

Feel free to fork, open issues, or contribute to extend this Terraform infrastructure repository.

---

