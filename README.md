# Infrastructure as Code (IaC) Deployment on Azure with Terraform and Git

## Tools used

- Terraform: To manage Azure resources in a declarative way, ensuring repeatable and consistent deployments.
- Azure: For deploying resources like virtual machines, networking components, and security configurations in the cloud.
- Git and GitHub: For version control and source code management, enabling seamless collaboration and automation of the infrastructure deployment process.

![My Skills](https://skillicons.dev/icons?i=vscode,git,github,terraform,azure&perline=5)


## Description

In this project, I designed and implemented an Azure Infrastructure as Code (IaC) solution using Terraform, enabling the seamless creation, management, and deployment of cloud resources. 
The Terraform code was written from scratch and is fully version-controlled using Git and hosted on GitHub for efficient collaboration and deployment.


## Key Features of the Project:

-  Azure Resource Group: Automated the creation of an Azure Resource Group, dynamically generating a unique name using the random_integer function for better scalability and isolation.
-  Network Security: Deployed a Network Security Group (NSG) with custom security rules, such as allowing RDP access (port 3389), ensuring a secure and controlled network environment for virtual machines.
-  Virtual Network and Subnets: Defined and provisioned a Virtual Network and Subnet with a custom IP address range, laying the groundwork for further network segmentation and expansion.
-  Public IP and Network Interface: Configured a dynamic public IP and associated it with a network interface for secure access to virtual machines deployed in the environment.
-  Windows Virtual Machine: Automated the provisioning of a Windows Server 2016 virtual machine, complete with OS disk configuration and administrative access, leveraging Azure's latest image versions.
-  GitHub Integration: Stored and version-controlled the entire Terraform code in a GitHub repository, enabling team collaboration, code review, and deployment automation.

## Evidence 

![Azure Portal](https://github.com/OLekgetho/Images/blob/main/Terraform/Terraform%20(5).png)
![Git](https://github.com/OLekgetho/Images/blob/main/Terraform/Terraform%20(4).png)
![Git](https://github.com/OLekgetho/Images/blob/main/Terraform/Terraform%20(3).png)
![Git](https://github.com/OLekgetho/Images/blob/main/Terraform/Terraforms%20(15).png)

## Outcome:

By using Terraform and Git in this project, I streamlined the process of setting up and managing infrastructure on Azure, demonstrating my ability to automate cloud deployments, maintain infrastructure consistency, and collaborate effectively in a team environment. This project showcases my skills in DevOps practices and cloud infrastructure management.
