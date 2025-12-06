# Infrastructure as Code -Obelion Cloud Automation Assessment

## Project Structure

```
.
├── environments/       # Environment-specific configurations (dev)
│   └── dev/            # Development environment
│       ├── main.tf     # Main configuration entry point
│       ├── variables.tf# Variable definitions
│       ├── outputs.tf  # Output definitions
│       └── backend.tf  # Backend configuration
├── modules/            # Reusable Terraform modules
│   ├── network/        # VPC, Subnets, IGW, Route Tables
│   ├── ec2/            # EC2 Instances, Security Groups
│   ├── rds/            # RDS Database
│   ├── cloudwatch/     # CloudWatch monitoring
│   ├── iam/            # IAM roles and policies
│   └── kms_and_secrets_manager/ # KMS and Secrets Manager
└── README.md           # Project documentation
```

### Key Components
- **VPC**: A custom Virtual Private Cloud to isolate resources.
- **Subnets**:
  - **Public**: Hosts the frontend application and is accessible from the internet.
  - **Private**: Hosts the backend application and database, accessible only within the VPC.
- **EC2 Instances**:
  - **Frontend**: Web server accessible via public IP.
  - **Backend**: Application server in the private subnet.
- **RDS**: Managed MySQL database in the private subnet for data persistence.
- **Security Groups**: Strict firewall rules to control traffic between components.

## Prerequisites

Before running this project, ensure you have the following:

1.  **Terraform**: Version 1.6.0 or later.
2.  **AWS CLI**: Configured with appropriate credentials.
3.  **S3 Bucket**: A bucket unique named in `us-east-1` & changing bucket name in backend.tf file for storing the Terraform state.

## Usage

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/Ahmedheggy/Task-group-A.git
    cd infra-terraform
    ```

2.  **Configure Variables**:
    Copy the example variable file and update it with your secrets.
    ```bash
    cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
    ```
    Edit `environments/dev/terraform.tfvars` and set your `db_password`, `ssh_key_name`, etc.
    
    Dont forget to add it to a .gitignore file since it contains a confidential data

3.  **Initialize Terraform**:
    Navigate to the environment directory and initialize the project.
    ```bash
    cd environments/dev
    terraform init
    ```

4.  **Plan the Infrastructure**:
    Preview the changes before applying.
    ```bash
    terraform plan
    ```

5.  **Apply Changes**:
    Provision the infrastructure.
    ```bash
    terraform apply
    ```


## Security Note

- **Secrets**: Never commit `terraform.tfvars` or `.tfstate` files to version control.

