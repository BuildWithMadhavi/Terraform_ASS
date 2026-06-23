# Terraform Azure reusable modules and workspace demo

This repository contains a reusable Terraform solution that deploys an Azure Resource Group, Storage Account, Virtual Network, and Key Vault using separate modules. It demonstrates using Terraform Workspaces to deploy `dev`, `prod`, and `test` environments and configures remote state using an Azure Storage Account backend (bootstrap step required).

Overview
- Modules: `modules/resource_group`, `modules/storage_account`, `modules/virtual_network`, `modules/key_vault`
- Backend bootstrap: `backend-bootstrap` creates the storage account and container for remote state
- Workspaces: Use `terraform workspace` to create `dev`, `prod`, and `test` without changing code

Quickstart
1. Login to Azure CLI:

```bash
az login
```

2. Create the backend storage account and container (bootstrap). Edit the variables or pass via `-var`:

```bash
cd backend-bootstrap
terraform init
terraform apply -var="storage_account_name=<unique_sa_name>" -auto-approve
```

Make note of the storage account name and container name output.

3. Initialize the main configuration with backend config (replace placeholders):

```bash
cd ..
terraform init \
  -backend-config="storage_account_name=<the_bootstrap_sa_name>" \
  -backend-config="container_name=tfstate" \
  -backend-config="key=terraform.tfstate" \
  -backend-config="resource_group_name=<backend_resource_group>"
```

We use the workspace name in `key` if you want per-workspace keys: `key="${terraform.workspace}.tfstate"` when performing manual backend config.

4. Create and switch to workspaces and deploy:

```bash
terraform workspace new dev || terraform workspace select dev
terraform apply -var="tenant_id=$(az account show --query tenantId -o tsv)" -auto-approve

terraform workspace new prod || terraform workspace select prod
terraform apply -var="tenant_id=$(az account show --query tenantId -o tsv)" -auto-approve

# Bonus: create test workspace without changing code
terraform workspace new test || terraform workspace select test
terraform apply -var="tenant_id=$(az account show --query tenantId -o tsv)" -auto-approve
```

State commands (examples)

After `terraform init` and `apply` in a workspace, run:

```bash
terraform state list
terraform state show <address>
terraform state pull > state.json
```

Notes and security
- Do not hardcode secrets. Use Azure Key Vault (or other secret stores) to store secrets.
- Sensitive values should be marked `sensitive = true` when appropriate and passed via env or secure mechanisms.
- This repo provides a bootstrap step to create the storage account used for remote state; you may also create that manually.
