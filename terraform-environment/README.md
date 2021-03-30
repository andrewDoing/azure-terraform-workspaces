# Create Terraform Environments in different workspaces

## Steps
### 1. Sign in to Azure CLI
```bash
# Log into the Azure CLI
$ az login

# Set your default subscription - this will dictate where resources will be provisioned
$ az account select -s <subscription-id>
```

### 2. Terraform commands for workspace 1
```bash
# Initialize the Terraform environment, connecting to the backend created earlier.
$ terraform init

# Create and switch to your workspace
$ terraform workspace new <workspace 1 name>

# See what the deployment will do. No changes will be applied, but you can review the changes that will be applied in the next step
$ terraform plan

# Deploy the changes. Choose 'yes' when prompted
$ terraform apply

```

### 3. Terraform commands for workspace 2
```bash
# Initialize the Terraform environment, connecting to the backend created earlier.
$ terraform init

# Create and switch to your workspace
$ terraform workspace new <workspace 2 name>

# See what the deployment will do. No changes will be applied, but you can review the changes that will be applied in the next step
$ terraform plan

# Deploy the changes. Choose 'yes' when prompted
$ terraform apply

```