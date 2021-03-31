# Create Terraform Environments in different workspaces

## Steps
### 1. Enable backend state
```bash
# Get the access key for the storage account created in the bootstrap process
$ export ARM_ACCESS_KEY=<REPLACE ME>

# Get the storage account name created in the bootstrap process
$ export ARM_ACCOUNT_NAME=<REPLACE ME>

# Most likely will be "tfstate-dev" if you are using a "dev" environment
$ export ARM_CONTAINER_NAME=<REPLACE ME>

# Initialize the deployment with the backend
$ terraform init -backend-config "storage_account_name=${ARM_ACCOUNT_NAME}" -backend-config "container_name=${ARM_CONTAINER_NAME}"

# Copy variables.tfvars from terraform-backend, for reuse in terraform-environment
cp ../terraform-backend/variables.tfvars variables.tfvars
```

### 2. Terraform commands to create workspace 1
```bash
# Create and switch to your workspace
$ terraform workspace new <workspace 1 name>

# See what the deployment will do. No changes will be applied, but you can review the changes that will be applied in the next step
$ terraform plan -var-file="variables.tfvars"

# Deploy the changes. Choose 'yes' when prompted
$ terraform apply -var-file="variables.tfvars"

```

### 3. Terraform commands to create workspace 2
```bash
# Create and switch to your workspace
$ terraform workspace new <workspace 2 name>

# See what the deployment will do. No changes will be applied, but you can review the changes that will be applied in the next step
$ terraform plan -var-file="variables.tfvars"

# Deploy the changes. Choose 'yes' when prompted
$ terraform apply -var-file="variables.tfvars"

```

## Congratulations!
### You have now deployed Terraform resources in separate workspaces, backed by one backend, all on Azure.