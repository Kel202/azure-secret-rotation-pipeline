# Automated Azure Key Vault Secret Rotation Pipe
> A production-inspired cloud security automation project built with Azure, Terraform, Python and Azure Functions.

---

# Why I Built This Project
Secrets such as API keys, database passwords, certificates, and connection strings are fundamental to modern cloud applications. However, they are often created once and forgotten until they expire or become compromised.

In many organizations, secret rotation is still performed manually. This creates several operational and security challenges:

- Expired secrets can cause application outages.
- Long-lived credentials increase the risk of unauthorized access.
- Manual rotation is repetitive, error-prone, and difficult to audit.
- Security teams spend valuable time performing routine maintenance instead of focusing on higher-value work.

As an aspiring Cloud Security Engineer, I wanted to build a solution that demonstrates how cloud automation can reduce operational risk while improving security.

This project automatically monitors Azure Key Vault, detects secrets approaching expiration, rotates them, and immediately notifies the team using Azure Communication Services.

The objective was not simply to automate a task, but to build a solution that reflects real-world cloud engineering practices using Infrastructure as Code, serverless computing, secure identity, and automated notifications.

---

# Project Overview

This project provisions Azure infrastructure using Terraform and deploys a Python Azure Function that automatically:

- Monitors Azure Key Vault secrets
- Detects secrets nearing expiration
- Generates a new secure password
- Updates the secret in Azure Key Vault
- Extends the expiration date
- Sends an email notification to the operations team
- Logs the entire execution process

The function runs automatically on a scheduled timer without requiring manual intervention.

---

# Technologies Used

| Technology | Purpose |
|------------|----------|
| Microsoft Azure | Cloud Platform |
| Terraform | Infrastructure as Code |
| Azure Functions | Serverless Automation |
| Azure Key Vault | Secret Management |
| Azure Communication Services | Email Notifications |
| Azure Storage Account | Function Storage |
| Python | Automation Logic |
| Azure CLI | Authentication |
| GitHub | Source Control |

---
# Features

- Infrastructure deployed using Terraform
- Secure secret storage using Azure Key Vault
- Automatic secret expiration monitoring
- Secure password generation
- Automatic secret rotation
- Email notifications after successful rotation
- Environment variables used for sensitive configuration
- Modular Terraform structure
- Timer-triggered serverless execution


# Project Workflow

1. Azure Function starts on a timer.
2. Authenticates using Azure CLI credentials.
3. Connects to Azure Key Vault.
4. Reads the target secret.
5. Calculates the remaining lifetime.
6. If the secret is nearing expiration:
   - Generates a new secure password.
   - Updates Azure Key Vault.
   - Extends the expiration date.
   - Sends an email notification.
7. Logs the execution.

---

      
