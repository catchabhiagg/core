Azure Terraform Core Infrastructure

Overview
This repository contains a production-style Azure infrastructure built using Terraform.
The project is designed with scalability and reusability in mind, following real-world DevOps and platform engineering practices.

The core idea of this setup is that infrastructure should scale by changing configuration (terraform.tfvars) and not by rewriting Terraform code.

---

Key Highlights

* Modular Terraform structure
* for_each and map(object) used across all resources
* Secure secret handling using Azure Key Vault
* Remote Terraform state stored in Azure Blob Storage
* RBAC-based access control
* Environment-ready structure (Env/Dev)

---

Repository Structure

core
├── Env
│    └── Dev
│         ├── provider.tf
│         ├── main.tf
│         ├── variables.tf
│         └── terraform.tfvars
│
└── Modules
├── 01_resourcegroup
├── 02_networking
├── 03_public_ip
├── 04_compute
├── 05_bastion
├── 06_sql_server
└── 07_sql_database

Each module represents a single responsibility and can be reused across environments.

---

Core Design Principle

All resources are created using for_each with map(object) variables.

This allows:

* Adding or removing resources without changing Terraform logic
* Predictable and stable Terraform state
* Easy extension to multiple environments like dev, qa, and prod

Scaling the infrastructure only requires updating terraform.tfvars.

---

Security and Secrets Management

Azure Key Vault is created manually through the Azure Portal.

* Secrets are stored manually
* Terraform only reads secrets using data blocks
* RBAC is used instead of access policies
* No secrets are hardcoded or committed to Git

Currently used secrets:

* VM admin username
* VM admin password
* SQL admin credentials

---

Terraform Backend

Terraform state is stored remotely using Azure Blob Storage.

This ensures:

* Centralized state management
* Safe state locking
* Team collaboration readiness

Backend configuration is defined in provider.tf.

---

Terraform Workflow

terraform init -reconfigure
terraform plan
terraform apply

Authentication:

* Local execution uses Azure CLI login
* Pipeline execution uses Azure DevOps Service Connection

---

Why This Project

This project intentionally avoids:

* Hardcoded values
* count-based resources
* Inline secrets
* Large monolithic Terraform files

Instead, it follows patterns commonly used by platform and DevOps teams in real production environments.

---

Planned Enhancements

* Azure DevOps YAML pipeline
* Multi-environment support (qa, prod)
* Private Endpoints (phase 2)
* Policy as Code
* Cost and tagging strategy

