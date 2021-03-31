# Create the backend in 3 easy steps
## What is a Terraform backend?
Used to store the Terraform state files remotely, so multiple users have access to an up to date state file.

**Note:** This terraform-backend state is managed locally. It could be managed within the backend it creates, but for simplicity it's ommitted.

## Azure Resources Created:
- Resource Group
    - Storage Account
        - Container

## Steps
### 1. Sign in to Azure CLI
```bash
# Log into the Azure CLI
$ az login

# Set your default subscription - this will dictate where resources will be provisioned
$ az account set -s <subscription-id>
```

### 2. Create file variables.tfvars
```bash
$ code variables.tfars

# Add the required variable to this file
project="YOUR_PROJECT_NAME"

# Add the optional variable to this file (default="westus2")
location="YOUR_AZURE_LOCATION"
```

### 2. Terraform commands
```bash
# Initialize the Terraform environment
$ terraform init

# See what the deployment will do. No changes will be applied, but you can review the changes that will be applied in the next step
$ terraform plan -var-file="variables.tfvars"

# Deploy the changes. Choose 'yes' when prompted
$ terraform apply -var-file="variables.tfvars"

```

## Congratulations! 
### You now have a terraform backend on Azure.
### Let's use it by following the instructions in the `terraform-environment` [README](../terraform-environment/README.md).

<!-- ### 3. Export Backend Variables
```bash
$ export ARM_ACCESS_KEY=$(terraform output backend-state-account-key)
$ export ARM_ACCOUNT_NAME=$(terraform output backend-state-account-name)
$ export ARM_CONTAINER_NAME=$(terraform output backend-state-bootstrap-container-name)

# Initialize the deployment with the backend
$ terraform init -backend-config "storage_account_name=${ARM_ACCOUNT_NAME}" -backend-config "container_name=${ARM_CONTAINER_NAME}"
``` -->