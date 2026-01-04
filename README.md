# Azure Infrastructure Provisioning with Terraform

## 📌 Overview

This repository contains **end-to-end Azure infrastructure provisioning** using **Terraform**, designed with **modularity, reusability, and scalability** in mind.

All Azure resources are created using **`for_each` and `map(object)` patterns**, enabling clean configuration management and easy environment expansion (Dev / QA / Prod).

The infrastructure is deployed via **Azure DevOps Pipeline**, with remote state management and secrets handled securely.

---

## 🧱 Architecture Summary

The following resources are provisioned **entirely through Terraform**:

* Resource Group
* Virtual Network (VNet)
* Subnets (including Azure Bastion Subnet)
* Public IP
* Azure Bastion
* Linux Virtual Machine
* Azure SQL Server
* Azure SQL Database

⚠️ **No application infrastructure is created manually**.

---

## 🔐 Bootstrap (Manual – One Time Only)

The following components are **manually created once** to bootstrap Terraform:

* Backend Resource Group
* Azure Storage Account (Terraform remote state)
* Blob Container (tfstate file)
* Azure Key Vault (secrets)

> Terraform does not manage its own backend or secret store.
> These resources are intentionally excluded from Terraform state.

---

## 📂 Repository Structure

```
core/
├── Env/
│   └── Dev/
│       ├── main.tf
│       ├── provider.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
├── Modules/
│   ├── 01_resourcegroup
│   ├── 02_networking
│   ├── 03_public_ip
│   ├── 04_compute
│   ├── 05_bastion
│   ├── 06_sql_server
│   └── 07_sql_database
│
└── README.md
```

---

## 🔁 Design Pattern Used

### ✅ `map(object)` + `for_each`

All resources are defined using **map-based configurations** in `terraform.tfvars` and iterated using `for_each` inside modules.

### Why this approach?

* Avoids duplicate code
* Enables multiple resources from a single module
* Makes infra **environment-driven**
* Easy to scale (add more VMs, VNets, DBs by config only)

### Example (conceptual):

```hcl
for_each = var.network
```

Infrastructure behavior changes by **updating tfvars only**, not Terraform logic.

---

## ⚙️ Environment Configuration

Each environment (Dev / QA / Prod) can have its own:

* `terraform.tfvars`
* Resource sizing
* Locations
* Naming conventions

This repository currently demonstrates the **Dev environment**.

---

## 🚀 Deployment Flow

1. Code pushed to GitHub
2. Azure DevOps Pipeline triggered
3. Terraform initializes remote backend
4. Terraform plan & apply executed
5. Azure infrastructure provisioned successfully

---

## 🔒 Security Practices

* No secrets hardcoded in Terraform
* Credentials stored in **Azure Key Vault**
* Remote state stored securely in **Azure Storage Account**
* No Public IP on VM (Bastion used for access)

---

## 🧠 Key Takeaways

* Backend and secrets are bootstrapped manually (best practice)
* All infra is Terraform-managed
* Modular, scalable, environment-agnostic design
* Uses **real-world DevOps patterns**, not demo shortcuts

---

## 🎯 Interview-Ready Summary

> “This project provisions Azure infrastructure using Terraform modules with `for_each` and map-based configurations, backed by a remote state and secure secret management. Only the backend and Key Vault are manually bootstrapped; everything else is fully declarative and pipeline-driven.”

---

## ✅ Status

✔ Infrastructure deployed successfully
✔ Pipeline executed without errors
✔ Repository is source of truth

