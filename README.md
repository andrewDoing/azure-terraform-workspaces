# Terraform Workspaces on Azure

## TLDR;
When deploying terraform configurations, oftentimes multiple environments are desired. Dev and Prod for example. These will be similar but have key differences. How can we re-use a cloud-based backend for each environment? 

One way is to use Workspaces.

## Workspaces Explained
Each terraform configuration has an associated backend that houses the Terraform state. This backend either exists locally, or for this example, can exist in the cloud.

The terraform state belongs to a workspace, and initially the backend has only one workspace, called "default".

The AzureRM terraform provider, among others, support multiple named workspaces, allowing multiple states to be associated with a single configuration. 

The configuration still has only one backend, but multiple distinct instances of that configuration to be deployed without configuring a new backend or changing authentication credentials.

## Getting Started

### 1. Deploy the terraform-backend 
[Instructions](./terraform-backend/README.md) (located in the terraform-backend folder)

### 2. Deploy the workspaced terraform-environment
[Instructions](./terraform-environment/README.md) (located in the terraform-environment folder)

## Workspaces illustrated in Portal
### Backend Container
![Created Container](/.media/workspaces_container.PNG)
### Backend Workspace State Files
![Created Workspace State Files](/.media/workspaces_state_files.PNG)
#### **Note:** the names of the state files follow the pattern `{backend.key}env:{workspace_name}`

## FAQs

### Q: Should I use workspaces?

#### Benefits:

- Utilize the same configuration to create different environments with separate state files
- One backend will support multiple environments
- State files for each workspace exist as separate blobs in one container
- Switch between environments with `terraform workspace` CLI commands

#### Considerations:

- Ensure strict security practices. For example, one may need to prevent read access for the prod state file, and keeping it in the same storage account as dev may pose a security risk.

## Links:
- [Terraform CLI Workspaces Docs](https://www.terraform.io/docs/language/state/workspaces.html)
- [Terraform Workspaces on Azure Tutorial by Daniel Wertheim](https://danielwertheim.se/terraform-workspaces-and-remote-state-in-azure/)