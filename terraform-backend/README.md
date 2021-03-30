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
$ az account select -s <subscription-id>
```

### 2. Terraform commands
```bash
# Initialize the Terraform environment
$ terraform init

# See what the deployment will do. No changes will be applied, but you can review the changes that will be applied in the next step
$ terraform plan

# Deploy the changes. Choose 'yes' when prompted
$ terraform apply

```

### 3. Export Backend Variables
```bash
$ export ARM_ACCESS_KEY=$(terraform output backend-state-account-key)
$ export ARM_ACCOUNT_NAME=$(terraform output backend-state-account-name)
$ export ARM_CONTAINER_NAME=$(terraform output backend-state-bootstrap-container-name)

# Initialize the deployment with the backend
$ terraform init -backend-config "storage_account_name=${ARM_ACCOUNT_NAME}" -backend-config "container_name=${ARM_CONTAINER_NAME}"
```