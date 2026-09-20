# 01.2 --- Challenges in Traditional Infrastructure

## 1. Overview

Before Infrastructure as Code (**IaC**), infrastructure was usually
created and managed manually through:

-   Cloud consoles
-   Manual server configuration
-   Human-written instructions
-   Tickets and approval processes
-   Individual administrator knowledge

Although this approach can work for small environments, it becomes
difficult to manage as infrastructure grows.

> **Key Idea:**\
> Traditional infrastructure management is **manual, slow, error-prone,
> difficult to reproduce, and hard to track**.

------------------------------------------------------------------------

## 2. Major Challenges

### 2.1 High Human Effort

Creating infrastructure manually requires engineers to perform many
repetitive steps.

Example: Creating an AWS EC2 instance manually may involve:

1.  Opening the AWS Console
2.  Selecting an AMI
3.  Choosing an instance type
4.  Configuring networking
5.  Selecting storage
6.  Configuring security groups
7.  Launching the instance
8.  Performing additional setup

Repeating these steps for many servers consumes significant time and
effort.

------------------------------------------------------------------------

### 2.2 Human Errors and Misconfiguration

Manual processes can lead to configuration mistakes.

For example:

  Server     Operating System   Instance Type
  ---------- ------------------ ---------------
  Server 1   Linux              Small
  Server 2   Windows            Large
  Server 3   Linux              Medium

These differences may be intentional, but they can also happen because
engineers followed different manual steps.

Common mistakes include:

-   Selecting the wrong operating system
-   Choosing the wrong instance size
-   Using an incorrect subnet
-   Applying the wrong security group
-   Missing required configuration steps
-   Entering incorrect values

> **Memory Hint:**\
> **Manual Steps → Human Errors → Misconfiguration**

------------------------------------------------------------------------

### 2.3 Slow Deployment

Traditional infrastructure provisioning can take days or weeks.

A typical process may involve:

``` text
Client Requirement
        │
        ▼
Manager Approval
        │
        ▼
Solution Architecture
        │
        ▼
Resource Assignment
        │
        ▼
Manual Infrastructure Setup
        │
        ▼
Testing and Handover
```

The same process may need to be repeated for multiple environments, such
as:

-   Development
-   Testing
-   QA
-   Staging
-   Production

This increases deployment time and delays application delivery.

> **Key Point:**\
> IaC helps reduce repetitive infrastructure work, but organizational
> approvals and security reviews may still be required.

------------------------------------------------------------------------

### 2.4 Lack of Consistency

Different engineers may configure similar infrastructure differently.

Example:

``` text
Engineer A → Ubuntu + t3.small + Security Group A
Engineer B → Amazon Linux + t3.medium + Security Group B
Engineer C → Ubuntu + t3.large + Security Group C
```

This can create differences between environments and make
troubleshooting harder.

Potential results:

-   "Works on one server but not another"
-   Environment-specific bugs
-   Difficult maintenance
-   Unpredictable deployments
-   Increased operational complexity

> **Memory Hint:**\
> **No Standard Process = No Consistent Result**

------------------------------------------------------------------------

### 2.5 Poor Scalability

Traditional manual processes do not scale efficiently.

Creating one server manually may be manageable. Creating 100 or 1,000
servers manually can be time-consuming and difficult to coordinate.

``` text
Manual Provisioning Effort

1 Server      → Manageable
10 Servers    → More effort
100 Servers   → High effort
1000 Servers  → Extremely difficult
```

During sudden traffic spikes, teams may struggle to provision additional
infrastructure quickly.

IaC makes large-scale provisioning more repeatable and easier to
automate.

------------------------------------------------------------------------

## 3. Limitations Before IaC

### 3.1 No Version Control

In traditional environments, infrastructure changes may not be stored in
a version-control system.

Consequences:

-   Changes are not properly tracked
-   Previous configurations may be unknown
-   It is difficult to identify who changed what
-   There may be no clear history of infrastructure changes

> **Memory Hint:**\
> **No Git = No Reliable History**

------------------------------------------------------------------------

### 3.2 Difficulty in Rollback

Suppose an administrator changes a server configuration and the
application stops working.

Without version-controlled infrastructure definitions, reverting to the
previous configuration can be difficult.

Possible problems:

-   Previous settings may not be documented
-   The exact change may be unknown
-   Manual rollback may introduce more errors
-   Recovery may take longer

With IaC and version control, teams can review previous configuration
versions and restore an appropriate version when necessary.

> **Important:**\
> Rolling back IaC code does not always automatically undo every
> infrastructure change. The resulting plan must be reviewed carefully.

------------------------------------------------------------------------

### 3.3 Knowledge Loss

In manual environments, important configuration knowledge may exist only
in an individual engineer's memory.

If that person leaves the team or becomes unavailable:

-   Other engineers may not know the exact steps
-   Infrastructure setup may be difficult to reproduce
-   Troubleshooting may take longer
-   Teams may depend heavily on specific individuals

Documentation such as runbooks and knowledge-base articles can help, but
IaC makes the configuration itself more explicit and reusable.

> **Memory Hint:**\
> **If Knowledge Exists Only in Someone's Head, It Is a Risk.**

------------------------------------------------------------------------

### 3.4 Configuration Drift

**Configuration drift** occurs when the actual infrastructure
configuration differs from the intended or documented configuration.

Example:

``` text
Intended Configuration
        │
        ▼
Ubuntu + t3.medium + Port 443 Allowed
        │
        ▼
Manual Change Made
        │
        ▼
Actual Configuration
        │
        └── Instance changed to t3.large
        └── Port rule modified
```

Common causes:

-   Direct manual changes
-   Emergency fixes
-   Unrecorded configuration updates
-   Different engineers applying different settings

Effects:

-   Infrastructure becomes unpredictable
-   Environments stop matching
-   Troubleshooting becomes difficult
-   Future deployments may behave unexpectedly

> **Exam Definition:**\
> **Configuration drift is the difference between the desired
> configuration and the actual infrastructure configuration.**

------------------------------------------------------------------------

### 3.5 Inefficient Resource Usage and Increased Cost

Traditional infrastructure management may result in poor resource
utilization.

Examples:

-   Unused servers remain running
-   Oversized instances are provisioned
-   Duplicate resources are created
-   Resources are not removed after testing
-   Engineers spend excessive time on repetitive tasks

This can lead to:

-   Higher cloud bills
-   Increased operational effort
-   Poor allocation of engineering resources
-   Wasted infrastructure capacity

> **Memory Hint:**\
> **Unused Resources + Manual Management = Higher Cost**

------------------------------------------------------------------------

## 4. Traditional Infrastructure vs. IaC

  -----------------------------------------------------------------------
  Area                    Traditional             Infrastructure as Code
                          Infrastructure          
  ----------------------- ----------------------- -----------------------
  Provisioning            Mostly manual           Code-driven and
                                                  automated

  Human effort            High                    Reduced through
                                                  automation

  Error risk              Higher                  Reduced through
                                                  repeatable definitions

  Deployment speed        Often slow              Usually faster and
                                                  repeatable

  Consistency             Depends on individuals  Same configuration can
                                                  be reused

  Scalability             Difficult manually      Easier to scale through
                                                  automation

  Version control         Often missing           IaC files can be stored
                                                  in Git

  Rollback                Difficult               Easier to review and
                                                  restore code versions

  Knowledge sharing       May depend on           Configuration is
                          individuals             documented as code

  Configuration drift     Common with manual      Can be detected and
                          changes                 corrected

  Resource management     May be inefficient      Can be automated and
                                                  standardized
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 5. Memory Trick

Remember the main traditional-infrastructure problems using:

# **M-E-S-C-S-V-R-K-D-C**

  Letter   Problem
  -------- --------------------------------
  M        Manual effort
  E        Errors and misconfiguration
  S        Slow deployment
  C        Lack of consistency
  S        Poor scalability
  V        No version control
  R        Difficult rollback
  K        Knowledge loss
  D        Configuration drift
  C        Cost and resource inefficiency

### Quick Phrase

> **"Manual Engineers Slowly Create Systems; Version Rollbacks Keep
> Deployments Costly."**

For quick revision, remember the shorter form:

``` text
Manual → Errors → Slow → Inconsistent → Difficult to Scale
                 ↓
       No History → No Easy Rollback
                 ↓
       Knowledge Loss → Drift → Higher Cost
```

------------------------------------------------------------------------

## 6. Interview Questions and Answers

### Q1. What were the major problems with traditional infrastructure?

**Answer:**\
Traditional infrastructure management required significant manual effort
and often resulted in human errors, slow deployments, inconsistent
configurations, poor scalability, lack of version control, difficult
rollback, knowledge loss, configuration drift, and inefficient resource
usage.

------------------------------------------------------------------------

### Q2. Why did organizations move toward IaC?

**Answer:**\
Organizations adopted IaC to automate infrastructure provisioning,
improve consistency, reduce manual errors, accelerate deployment,
support scalability, enable version control, and make infrastructure
easier to reproduce and manage.

------------------------------------------------------------------------

### Q3. What is configuration drift?

**Answer:**\
Configuration drift occurs when the actual infrastructure differs from
the desired or documented configuration, often because of manual or
untracked changes.

------------------------------------------------------------------------

### Q4. How does IaC reduce configuration drift?

**Answer:**\
IaC defines the desired infrastructure configuration in code. Tools such
as Terraform can compare the desired configuration with the current
state and identify required changes. However, teams must still follow
good processes and avoid unauthorized manual changes.

------------------------------------------------------------------------

### Q5. Why is manual provisioning difficult to scale?

**Answer:**\
Manual provisioning requires engineers to repeat the same steps for each
resource. As the number of servers or environments increases, the time,
effort, and risk of errors increase significantly.

------------------------------------------------------------------------

### Q6. How does version control help infrastructure management?

**Answer:**\
Version control stores the history of infrastructure code, allowing
teams to review changes, identify contributors, compare versions,
collaborate, and restore earlier configurations when appropriate.

------------------------------------------------------------------------

### Q7. What is the relationship between configuration drift and manual changes?

**Answer:**\
Manual changes made outside the defined process can cause the actual
infrastructure to differ from the intended configuration. This
difference is called configuration drift.

------------------------------------------------------------------------

## 7. Scenario-Based Question

### Scenario: Different Environments Have Different Configurations

**Question:**\
Your development and production environments were created manually. The
application works in development but fails in production. What could be
the problem?

**Possible Causes:**

-   Different operating system versions
-   Different instance types
-   Different security-group rules
-   Different environment variables
-   Missing dependencies
-   Different network settings
-   Manual configuration mistakes

**How IaC Helps:**

1.  Define infrastructure in reusable configuration files.
2.  Store the files in version control.
3.  Review and validate changes.
4.  Reuse the same configuration pattern across environments.
5.  Use environment-specific variables where necessary.
6.  Detect unexpected changes and reduce configuration drift.

------------------------------------------------------------------------

## 8. Exam-Focused Points

-   Traditional infrastructure commonly depends on manual provisioning.
-   Manual provisioning increases human effort and error risk.
-   Manual configuration can cause inconsistent environments.
-   Traditional infrastructure may take days or weeks to provision.
-   Manual processes are difficult to scale during sudden demand
    increases.
-   Lack of version control makes change tracking difficult.
-   Rollback is harder when previous configurations are not recorded.
-   Knowledge concentrated in one person creates operational risk.
-   Configuration drift means actual infrastructure differs from the
    intended configuration.
-   Inefficient resource management can increase operational costs.
-   IaC addresses many of these problems through repeatability,
    automation, and version-controlled configuration.

------------------------------------------------------------------------

## 9. Quick Revision

``` text
Traditional Infrastructure Problems:

1. High manual effort
2. Human errors
3. Slow deployment
4. Inconsistent configurations
5. Poor scalability
6. No reliable version history
7. Difficult rollback
8. Knowledge loss
9. Configuration drift
10. Increased cost and resource waste

Why IaC?

Code + Automation + Version Control
                ↓
Consistency + Repeatability + Scalability
                ↓
Faster and easier infrastructure management
```

### One-Line Interview Summary

> Traditional infrastructure relied heavily on manual provisioning,
> which caused errors, slow deployments, inconsistent environments, poor
> scalability, configuration drift, limited traceability, and higher
> operational costs; IaC addresses these issues through automation and
> code-based management.
