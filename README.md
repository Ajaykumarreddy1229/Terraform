# Terraform
# Terraform – Complete Study Notes for DevOps and Cloud Engineers

## 1. Introduction to Terraform

Terraform is an Infrastructure as Code (IaC) tool developed by HashiCorp.

It is used to create, manage, and automate cloud infrastructure using configuration files.

Instead of manually creating infrastructure through cloud consoles, we can define our infrastructure using code and provision it automatically.

Terraform supports multiple cloud providers, including:

- AWS
- Microsoft Azure
- Google Cloud Platform (GCP)
- Oracle Cloud
- Other platforms through providers

### Why Do We Need Terraform?

Until now, we have been creating AWS infrastructure manually, such as:

- EC2 Instances
- Elastic Load Balancers (ELB)
- Auto Scaling Groups (ASG)
- S3 Buckets
- RDS Databases
- VPCs
- Subnets
- Security Groups

Creating infrastructure manually has some disadvantages:

1. **Time-consuming:** Creating multiple resources manually takes a lot of time.
2. **Human errors:** We may make mistakes while configuring infrastructure.
3. **Difficult tracking:** Managing and tracking manually created infrastructure becomes difficult.
4. **Repetition:** Recreating the same infrastructure in multiple environments requires repeating the same steps.
5. **Scalability:** Managing large infrastructure manually becomes complicated.

**Solution:** Infrastructure as Code (IaC).

Terraform allows us to define infrastructure in configuration files and create it automatically.

---

## 2. History of Terraform

Before Terraform, cloud providers had their own infrastructure automation tools.

| Cloud Provider | Infrastructure Automation Tool |
|---|---|
| AWS | CloudFormation |
| Microsoft Azure | Azure Resource Manager (ARM) |
| Google Cloud | Deployment Manager (now retired) |

AWS introduced CloudFormation in 2011 to automate infrastructure provisioning using JSON and YAML templates.

However, managing infrastructure across different cloud providers using separate tools could become complicated.

HashiCorp created Terraform to provide a consistent Infrastructure as Code workflow across multiple cloud providers.

### Terraform History

- **Creator:** Mitchell Hashimoto
- **Company:** HashiCorp
- **First released:** July 2014 (Terraform 0.1)
- **Programming language:** Go
- **Configuration language:** HCL (HashiCorp Configuration Language)
- **Corporate ownership:** IBM acquired HashiCorp in February 2025.

### Terraform Licensing

Terraform was originally released under the Mozilla Public License (MPL 2.0).

Starting with Terraform 1.6, HashiCorp changed its license to the Business Source License (BUSL 1.1).

Therefore, current Terraform is source-available but is not OSI-approved open-source software.

**OpenTofu** was created as an open-source fork of Terraform and is maintained by the Linux Foundation.

---

## 3. What Is Infrastructure as Code (IaC)?

Infrastructure as Code means creating and managing infrastructure using configuration files instead of manually creating resources through a cloud console.

### Traditional Approach

1. Log in to AWS.
2. Create a VPC.
3. Create subnets.
4. Create security groups.
5. Launch EC2 instances.
6. Configure load balancers.

### Terraform Approach

1. Write Terraform configuration files.
2. Initialize Terraform.
3. Validate the configuration.
4. Generate an execution plan.
5. Apply the configuration.
6. Terraform creates the infrastructure.

### Benefits of IaC

- Automation
- Consistency
- Repeatability
- Version control
- Reduced human errors
- Faster infrastructure provisioning
- Easier infrastructure management

---

## 4. Terraform Alternatives

Some popular Infrastructure as Code tools are:

| Tool | Purpose |
|---|---|
| Terraform | Infrastructure provisioning |
| OpenTofu | Open-source Terraform alternative |
| Pulumi | Infrastructure provisioning using programming languages |
| AWS CloudFormation | AWS infrastructure automation |
| Azure ARM / Bicep | Azure infrastructure management |
| Ansible | Configuration management and automation |

---

## 5. Terraform vs Ansible

Terraform and Ansible are both widely used in DevOps, but they have different primary purposes.

| Terraform | Ansible |
|---|---|
| Mainly used for infrastructure provisioning | Mainly used for configuration management |
| Creates infrastructure resources | Configures servers and applications |
| Uses HCL | Uses YAML playbooks |
| Uses providers | Uses modules |
| Manages infrastructure state | Generally works without a Terraform-style state file |

### Real-Time DevOps Example

Suppose we need to deploy an application on AWS.

**Terraform:**
- Creates VPC.
- Creates subnets.
- Creates security groups.
- Launches EC2 instances.
- Creates load balancers.

**Ansible:**
- Installs Java.
- Installs Maven.
- Installs Docker.
- Configures application servers.
- Deploys applications.

**Conclusion:** Terraform can provision the infrastructure, and Ansible can configure the servers created by Terraform.

---

## 6. Terraform Configuration File Structure

Terraform does not mandate specific filenames such as `main.tf`, `variables.tf`, or `outputs.tf`.

Terraform reads configuration from all `.tf` files in the working directory.

However, following a standard file structure makes projects easier to understand and maintain.

### Common Terraform Project Structure

```text
terraform-project/
│
├── provider.tf
├── versions.tf
├── backend.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── data.tf
├── locals.tf
│
└── README.md
```

### Explanation of Each File

| File | Purpose |
|---|---|
| `provider.tf` | Configures the cloud provider, such as AWS, Azure, or GCP. |
| `versions.tf` | Defines required Terraform and provider versions. |
| `backend.tf` | Configures where Terraform state is stored. |
| `main.tf` | Contains the main infrastructure resource definitions. |
| `variables.tf` | Declares input variables. |
| `terraform.tfvars` | Provides values for declared variables. |
| `outputs.tf` | Defines output values displayed after execution. |
| `data.tf` | Defines data sources to retrieve information about existing resources. |
| `locals.tf` | Defines local values to simplify configuration. |

**Important:** These filenames are conventions, not mandatory requirements. We can organize Terraform configuration files according to project requirements.

---

## 7. Understanding Important Terraform Files

### provider.tf

The provider block tells Terraform which cloud provider or platform it should communicate with.

Example:

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

### versions.tf

Specifies the Terraform version requirements and provider versions.

Example:

```hcl
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
```

Note: The provider version constraint is an example. Select a version compatible with your project.

### main.tf

Contains the main infrastructure resources.

Example:

```hcl
resource "aws_instance" "webserver" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}
```

The AMI ID is an example placeholder. Use a valid AMI for your selected AWS region.

### variables.tf

Declares input variables.

Example:

```hcl
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
```

### terraform.tfvars

Provides values for variables.

Example:

```hcl
instance_type = "t3.micro"
```

### outputs.tf

Displays useful information after infrastructure creation.

Example:

```hcl
output "instance_id" {
  value = aws_instance.webserver.id
}
```

### data.tf

Used to retrieve information about existing infrastructure without necessarily creating a new resource.

### locals.tf

Used to define reusable local values.

Example:

```hcl
locals {
  project_name = "terraform-project"
  environment  = "dev"
}
```

### backend.tf

Defines where Terraform stores its state file.

For example, Terraform can use an Amazon S3 bucket as a remote backend.

Remote state is useful when multiple team members work on the same infrastructure.

---

## 8. Important Terraform Commands

| Command | Purpose |
|---|---|
| `terraform version` | Checks Terraform version |
| `terraform init` | Initializes the working directory and downloads required providers |
| `terraform fmt` | Formats Terraform configuration files |
| `terraform validate` | Checks configuration syntax and internal consistency |
| `terraform plan` | Shows the proposed infrastructure changes |
| `terraform apply` | Applies the planned changes |
| `terraform show` | Displays the current state or saved plan |
| `terraform output` | Displays output values |
| `terraform destroy` | Destroys resources managed by the configuration |

### Basic Terraform Workflow

```text
Write Terraform Configuration
           |
           v
     terraform init
           |
           v
     terraform fmt
           |
           v
   terraform validate
           |
           v
     terraform plan
           |
           v
     terraform apply
           |
           v
 Infrastructure Created
```

---

## 9. Important Terraform Concepts to Learn Next

After understanding the introduction and file structure, the next topics to practice are:

1. Terraform Installation
2. Terraform Providers
3. Terraform Resources
4. Terraform Variables
5. Terraform Data Sources
6. Terraform Outputs
7. Terraform State File
8. Terraform Backend
9. Terraform Modules
10. Terraform Workspaces
11. Terraform Provisioners
12. Terraform Lifecycle Rules
13. Terraform with AWS
14. Terraform with CI/CD using Jenkins

---

## 10. Conclusion

Terraform is an important Infrastructure as Code tool for DevOps and Cloud Engineers.

It helps automate infrastructure creation, reduce manual work, maintain consistency, and manage resources across multiple cloud platforms.

Learning Terraform is an important step towards becoming a skilled DevOps and Cloud Engineer.

**My Learning Goal:** Practice Terraform hands-on with AWS and build real-time infrastructure automation projects.

---

## Topics Covered

- Introduction to Terraform
- History of Terraform
- Infrastructure as Code (IaC)
- Terraform Alternatives
- Terraform vs Ansible
- Terraform Project Structure
- Important Terraform Files
- Basic Terraform Commands
- Terraform Learning Roadmap
