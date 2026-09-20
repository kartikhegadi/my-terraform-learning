# 01 --- Introduction to Infrastructure as Code

## 1. What Is Infrastructure as Code?

**Infrastructure as Code (IaC)** is the practice of **managing and
provisioning infrastructure using code instead of manual processes**.

Infrastructure can include:

-   Servers and virtual machines
-   Networks and subnets
-   Databases
-   Load balancers
-   Storage
-   Security configurations
-   Cloud resources

### Simple Example

Suppose you want to create an AWS EC2 instance.

### Manual Approach

``` text
AWS Console
    │
    ├── Click "Launch Instance"
    ├── Select AMI
    ├── Choose instance type
    ├── Configure networking
    ├── Configure storage
    └── Launch instance
```

If you need to repeat this process 10 or 100 times, manual creation
becomes slow and error-prone.

### IaC Approach

You define the required infrastructure in code:

``` text
Infrastructure Code
        │
        ▼
Automation Tool
        │
        ▼
AWS EC2 Instance
```

The same code can be reused to create consistent infrastructure multiple
times.

> **Memory Hint:**\
> **IaC = Infrastructure + Automation + Repeatability**

------------------------------------------------------------------------

## 2. Why Is It Called Infrastructure as Code?

It is called **Infrastructure as Code** because:

-   **Infrastructure:** You manage servers, networks, databases, and
    other infrastructure resources.
-   **As Code:** You describe and manage those resources using
    configuration files and code.

Terraform is one of the popular tools used to implement IaC.

------------------------------------------------------------------------

## 3. Why Do We Use IaC?

Without IaC, infrastructure is often created manually through cloud
consoles or by following written instructions.

This can lead to:

-   Human errors
-   Configuration differences
-   Slow deployments
-   Difficult maintenance
-   Poor repeatability
-   Lack of proper change tracking

IaC allows teams to define infrastructure in files, review changes,
reuse configurations, and automate deployments.

------------------------------------------------------------------------

## 4. Benefits of Infrastructure as Code

### 4.1 Cost Optimization

IaC helps automate resource management.

You can:

-   Create resources when required
-   Reuse configurations
-   Remove unused resources through automation
-   Manage infrastructure across multiple environments and accounts

> **Important:** IaC does not automatically reduce costs. It helps
> improve cost control through automation and repeatable resource
> management.

------------------------------------------------------------------------

### 4.2 Consistency

IaC ensures that infrastructure is created using the same configuration
every time.

#### Without IaC

``` text
Engineer A → Server Type A + OS Version 1
Engineer B → Server Type B + OS Version 2
Engineer C → Different Network Settings
```

This can create configuration inconsistencies.

#### With IaC

``` text
                Same Configuration
                       │
        ┌──────────────┼──────────────┐
        ▼              ▼              ▼
      DEV             QA             PROD
   Consistent      Consistent      Consistent
   Setup           Setup           Setup
```

> **Memory Hint:**\
> **Same Code → Same Configuration → Fewer Surprises**

------------------------------------------------------------------------

### 4.3 Speed and Automation

IaC accelerates infrastructure deployment by reducing repetitive manual
work.

Instead of creating resources step by step, you execute automation
commands.

Benefits include:

-   Faster provisioning
-   Reduced manual effort
-   Repeatable deployments
-   Easier environment creation

------------------------------------------------------------------------

### 4.4 Scalability

IaC makes it easier to manage infrastructure ranging from a single
server to hundreds of resources.

``` text
One Configuration
       │
       ├── 1 Server
       ├── 10 Servers
       ├── 100 Servers
       └── Multiple Environments
```

The same configuration can often be reused with suitable changes in
variables or parameters.

> **Memory Hint:**\
> **Write Once → Reuse Many Times**

------------------------------------------------------------------------

### 4.5 Easy Environment Replication

IaC helps create similar environments for:

-   Development
-   Testing
-   QA
-   Staging
-   Production

For example, a production environment can be reproduced in a test
environment using the same infrastructure definition.

``` text
Production Configuration
          │
          ▼
   Reusable IaC Code
          │
    ┌─────┼─────┬─────┐
    ▼     ▼     ▼     ▼
   DEV    QA   STAGE  PROD
```

> **Important:** Environment-specific values may still need to be
> changed, such as instance size, region, credentials, or scaling
> limits.

------------------------------------------------------------------------

### 4.6 Version Control

IaC files can be stored in Git or another version-control system.

This allows teams to:

-   Track infrastructure changes
-   View the history of modifications
-   Review changes before applying them
-   Roll back code changes when appropriate
-   Collaborate using branches and pull requests

Example:

``` text
Version 1 → Create one EC2 instance
Version 2 → Add security group
Version 3 → Add monitoring
Version 4 → Update instance type
```

> **Memory Hint:**\
> **Git answers: Who changed what, when, and why?**

------------------------------------------------------------------------

### 4.7 Collaboration

A shared IaC codebase allows multiple engineers to work together.

Teams can:

-   Review infrastructure code
-   Share reusable modules
-   Follow common standards
-   Avoid maintaining separate manual documentation
-   Integrate infrastructure changes into CI/CD pipelines

------------------------------------------------------------------------

## 5. Infrastructure as Code Workflow

A common IaC workflow is:

``` text
┌──────────────────────┐
│ 1. Write IaC Code    │
└──────────┬───────────┘
           ▼
┌──────────────────────┐
│ 2. Store in Git      │
└──────────┬───────────┘
           ▼
┌──────────────────────┐
│ 3. Test and Review   │
└──────────┬───────────┘
           ▼
┌──────────────────────┐
│ 4. Apply Changes     │
└──────────┬───────────┘
           ▼
┌──────────────────────┐
│ Infrastructure Ready │
└──────────────────────┘
```

### Step 1: Write the Code

Create the required infrastructure configuration files.

For Terraform, these files generally use the `.tf` extension.

Example:

``` text
main.tf
variables.tf
outputs.tf
providers.tf
```

### Step 2: Store the Code in Version Control

Push the code to Git or a platform such as GitHub, GitLab, or Bitbucket.

### Step 3: Test and Review

Before applying changes:

-   Check the syntax
-   Validate the configuration
-   Review the planned changes
-   Perform peer review
-   Run automated checks where applicable

### Step 4: Apply the Changes

Execute the IaC tool to provision or update the infrastructure.

For Terraform, the common command is:

``` bash
terraform apply
```

> **Note:** Terraform commands will be covered in later sections.

------------------------------------------------------------------------

## 6. Important IaC Terms

  -----------------------------------------------------------------------
  Term                                Meaning
  ----------------------------------- -----------------------------------
  IaC                                 Infrastructure as Code

  Infrastructure                      Servers, networks, databases,
                                      storage, and related resources

  Provisioning                        Creating and configuring
                                      infrastructure

  Configuration                       The desired settings of
                                      infrastructure

  Automation                          Using tools or scripts to perform
                                      tasks with minimal manual effort

  Version Control                     Tracking changes to files over time

  Environment                         A separate setup such as Dev, QA,
                                      Staging, or Production

  Repeatability                       Ability to perform the same process
                                      consistently

  Scalability                         Ability to manage increasing
                                      infrastructure requirements
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 7. Quick Memory Formula

Remember the main benefits of IaC using:

# **C-C-S-S-R-V-C**

  Letter   Benefit
  -------- -----------------------------
  C        Cost optimization
  C        Consistency
  S        Speed and automation
  S        Scalability
  R        Replication of environments
  V        Version control
  C        Collaboration

### Easy Sentence

> **"Consistent Systems Scale Rapidly Via Collaboration."**

Use the following keywords for quick revision:

``` text
Cost → Consistency → Speed → Scale → Replication → Versioning → Collaboration
```

------------------------------------------------------------------------

## 8. Interview Questions and Answers

### Q1. What is Infrastructure as Code?

**Answer:**\
Infrastructure as Code is the practice of managing and provisioning
infrastructure such as servers, networks, and databases through code
instead of manual processes.

------------------------------------------------------------------------

### Q2. Why is IaC useful?

**Answer:**\
IaC improves consistency, repeatability, speed, scalability,
collaboration, and change tracking while reducing manual errors.

------------------------------------------------------------------------

### Q3. Give a real-world example of IaC.

**Answer:**\
Instead of manually creating an EC2 instance through the AWS Console, we
can define the instance configuration in Terraform code and use
Terraform to create it automatically.

------------------------------------------------------------------------

### Q4. How does IaC improve consistency?

**Answer:**\
IaC uses the same configuration files to create infrastructure across
environments, reducing differences caused by manual configuration.

------------------------------------------------------------------------

### Q5. How does Git help with IaC?

**Answer:**\
Git tracks infrastructure code changes, supports reviews and
collaboration, and provides a history of who changed what and when.

------------------------------------------------------------------------

### Q6. Can IaC be used for multiple environments?

**Answer:**\
Yes. The same IaC configuration can be reused to create Development, QA,
Staging, and Production environments with environment-specific values.

------------------------------------------------------------------------

### Q7. Does IaC automatically reduce cloud costs?

**Answer:**\
Not automatically. IaC helps control costs by automating resource
creation and deletion, improving consistency, and reducing unnecessary
manual operations.

------------------------------------------------------------------------

### Q8. What is the basic IaC workflow?

**Answer:**

``` text
Write Code → Store in Git → Test and Review → Apply Changes
```

------------------------------------------------------------------------

## 9. Scenario-Based Question

### Scenario: Creating 100 Similar Servers

**Question:**\
Your team needs to create 100 similar servers. How would IaC help?

**Answer:**

1.  Define the server configuration in IaC code.
2.  Store the code in Git.
3.  Review and validate the configuration.
4.  Use the IaC tool to provision the required number of servers.
5.  Reuse the same configuration for other environments.
6.  Track future changes through version control.

**Result:** Faster, more consistent, repeatable, and easier-to-manage
infrastructure deployment.

------------------------------------------------------------------------

## 10. Exam-Focused Points

-   IaC manages infrastructure using code rather than manual processes.
-   IaC can manage servers, networks, databases, storage, and other
    infrastructure resources.
-   Repeatability and consistency are key advantages of IaC.
-   IaC supports version control and collaboration.
-   IaC makes it easier to replicate environments.
-   IaC improves automation and deployment speed.
-   IaC can support infrastructure ranging from a single resource to
    large-scale environments.
-   Terraform is an IaC tool.
-   IaC code should ideally be tested, reviewed, and version-controlled
    before deployment.

------------------------------------------------------------------------

## 11. Quick Revision

``` text
IaC = Infrastructure managed through code.

Main Problems Solved:
- Manual errors
- Inconsistent configurations
- Slow provisioning
- Difficult replication
- Poor change tracking

Main Benefits:
- Cost control
- Consistency
- Speed
- Scalability
- Environment replication
- Version control
- Collaboration

Workflow:
Write → Version Control → Test/Review → Apply
```

### One-Line Definition for Interviews

> **Infrastructure as Code is the practice of defining, provisioning,
> and managing infrastructure through machine-readable configuration
> files instead of manual processes.**
