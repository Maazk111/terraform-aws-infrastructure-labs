# 🌍 Terraform Projects — AWS Infrastructure Automation

## 📘 Overview
This repository demonstrates my **Terraform proficiency** through a series of structured, hands-on exercises.  
It showcases how I **design, provision, and manage AWS infrastructure** as code (IaC) using Terraform best practices — from foundational concepts to **advanced modular automation including Amazon EKS (Elastic Kubernetes Service)**.

The goal of this repository is to help recruiters, hiring managers, and technical reviewers quickly assess:

- 💡 Understanding of Terraform fundamentals & architecture
- ⚙️ Ability to apply **real-world DevOps practices** (variables, remote state, outputs, provisioning)
- ☁️ Experience working with **AWS resources** in an automated, consistent, and reusable way
- 🚀 Capability to **deploy and manage containerized workloads** using **Amazon EKS** via Terraform

---

## 🧱 Exercises Overview

### **1️⃣ Introduction to Terraform**
- Introduces Terraform as an IaC tool.
- Connects Terraform to AWS via IAM credentials.
- Launches a simple EC2 instance.
- **Focus:** Providers, resources, and state files.

---

### **2️⃣ Basics of Terraform**
- Fetches AWS data dynamically using **data sources**.
- Retrieves latest Ubuntu AMI ID.
- Commands: `init`, `fmt`, `validate`, `plan`, `apply`.
- **Focus:** Terraform workflow & syntax.

---

### **3️⃣ Code Structure & State Management**
- Splits configuration into multiple `.tf` files (provider, keypair, SG, instance).
- Explains local **Terraform state management**.
- **Focus:** Code organization & modular thinking.

---

### **4️⃣ Provisioners**
- Automates web server setup using:
  - 🧩 **file provisioner** → uploads web.sh
  - ⚡ **remote-exec** → executes commands remotely
- Deploys Apache web app using Tooplate template.
- **Focus:** Post-provisioning automation.

---

### **5️⃣ Outputs**
- Displays EC2 public/private IPs via **output variables**.
- Stores values locally using `local-exec`.
- **Focus:** Retrieving & exporting Terraform data.

---

### **6️⃣ Backends**
- Configures **S3 remote backend** for shared Terraform state.
- Demonstrates collaborative state management.
- Mentions advanced backends like **HCP Terraform** & **Consul**.
- **Focus:** Remote state management & team collaboration.

---

### **7️⃣ VPC Manual Setup**
- Builds full AWS **VPC** manually:
  - VPC, subnets, IGW, route tables, EC2s.
- No NAT gateway (to reduce costs 💰).
- **Focus:** AWS networking & dependencies.

---

### **8️⃣ VPC Using Terraform Modules**
- Uses official **AWS VPC Module**.
- Creates 3 public + 3 private subnets, NAT, routes.
- Simplifies complex setup using modular IaC.
- **Focus:** Reusability, parameterization, and scalability.

### 9️⃣ Terraform EKS Setup — Managed Kubernetes Cluster (Amazon EKS)

This lab automates the creation of a **managed Kubernetes cluster (EKS)** on AWS using Terraform modules for both the **VPC** and the **EKS cluster**.  
It combines concepts from previous labs — Terraform modules, AWS networking, and Kubernetes infrastructure automation — to deploy a **production-grade cluster**.

---

### 🧩 Highlights

- Uses `terraform-aws-modules/vpc` and `terraform-aws-modules/eks`
- Creates **3 public + 3 private subnets**, Internet Gateway, and NAT Gateway
- Provisions **EKS control plane** and **two managed node groups (t3.small)**
- Configures **remote state storage** in an **S3 backend**
- Generates **kubeconfig** for `kubectl` access
- Demonstrates **cost optimization** and cleanup with `terraform destroy`

---

### 📁 Key Files

| **File** | **Purpose** |
|-----------|--------------|
| `terraform.tf` | Defines providers, versions, and S3 backend configuration |
| `variables.tf` | Defines cluster name, region, and input variables |
| `vpc.tf` | Declares the VPC module with subnets, routes, and tags |
| `eks-cluster.tf` | Declares the EKS module and managed node groups |
| `outputs.tf` | Displays cluster endpoint and node information |
| `main.tf` | Orchestrates providers and resource dependencies |

---

### ⚙️ Commands

```bash
terraform init
terraform plan
terraform apply
aws eks update-kubeconfig --name <cluster-name> --region us-east-1
kubectl get nodes
terraform destroy   # Cleanup to avoid billing
```

---

### 🧠 Focus

- **Managed Kubernetes deployment** via Terraform modules
- **Multi-resource orchestration** (VPC → EKS → Nodes)
- **Remote state management** with S3
- **Kubernetes provider integration**
- **Practical DevOps cost control** and cleanup automation
---

## 🧰 Tools & Technologies

| **Category** | **Tools / Services** |
|---------------|----------------------|
| **Infrastructure as Code** | Terraform (HashiCorp) |
| **Cloud Provider** | AWS |
| **Compute** | EC2 Instances |
| **Networking** | VPC, Subnets, Route Tables, Internet/NAT Gateways |
| **Storage / State Management** | S3 Remote Backend |
| **Provisioning & Automation** | File & Remote-Exec Provisioners |
| **Modules** | Official Terraform AWS VPC Module |
| **Languages / Formats** | HCL (HashiCorp Configuration Language), Bash |

---
# 📁 Folder & File Conventions

- Each exercise = standalone directory
- File naming:
  - `provider.tf` → AWS config
  - `variables.tf` → input vars
  - `outputs.tf` → outputs
  - `backend.tf` → remote state
  - `main.tf` → main logic
  - `keypair.tf`, `security-group.tf` → resource-specific

---
# 🧰 Skills Demonstrated

- **Terraform Fundamentals:** Providers, resources, data sources, and states.
- **Infrastructure Automation:** EC2, VPC, Subnets, and routing with Terraform.
- **Code Modularity:** Multi-file and module-based design.
- **Provisioning Automation:** File and Remote-Exec provisioners for server setup.
- **State Management:** Local & remote (S3 backend) state handling.
- **Output Management:** Extracting useful information for DevOps workflows.
- **Networking Architecture:** Manual and modular VPC design.
- **Best Practices:** Formatting, validation, security (no hardcoded creds).
- **Scalability & Collaboration:** Remote state for shared infra development.
---
## ⚙️ Setup & Usage

### 🧩 Prerequisites

- **AWS Account** with IAM user and Access/Secret keys
- **Terraform CLI** installed → [Install Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- **AWS CLI** installed and configured (`aws configure`)
- **VS Code** (recommended IDE)

---

## 🚀 How to Run Any Exercise

### 1. Clone the repository
```bash
git clone https://github.com/<your-username>/terraform-labs.git
cd terraform-labs/Exercise1-IntroToTerraform
```

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Format & Validate
```bash
terraform fmt
terraform validate
```

### 4. Preview Infrastructure Plan
```bash
terraform plan
```

### 5. Apply Configuration
```bash
terraform apply
```

### 6. (Optional) Destroy Resources
```bash
terraform destroy
```

> ⚠️ **Note:** Some exercises (like VPC with NAT gateway) may incur minimal AWS charges — destroy resources after testing.
---

## 🏆 Summary Table

| Exercise | Focus Area     | Key Concepts                         |
|-----------|----------------|--------------------------------------|
| 1         | Introduction   | IaC, providers, state                |
| 2         | Basics         | Data sources, AMI fetching           |
| 3         | Structure      | Modular files, state                 |
| 4         | Provisioners   | Automation via SSH                   |
| 5         | Outputs        | IP outputs, local-exec               |
| 6         | Backends       | S3 remote backend                    |
| 7         | VPC Manual     | AWS networking                       |
| 8         | VPC Module     | Modular, scalable infra              |
| 9         | EKS Cluster    | Managed Kubernetes, modules, scaling |

> *"Infrastructure as Code isn’t just automation — it’s reproducibility, reliability, and professionalism."* 🌱

