#!/bin/bash

# Repository name
REPO_NAME="my-terraform-learning"

# Create and enter the repository directory
mkdir -p "$REPO_NAME"
cd "$REPO_NAME" || exit 1

# Initialize Git
git init

# Create root files
touch README.md LICENSE .gitignore

# Function to create a course section
create_section() {
    FOLDER_NAME="$1"
    FILE_NAME="$2"
    CREATE_TERRAFORM_FOLDER="$3"

    mkdir -p "$FOLDER_NAME"
    touch "$FOLDER_NAME/$FILE_NAME.md"

    if [ "$CREATE_TERRAFORM_FOLDER" = "yes" ]; then
        mkdir -p "$FOLDER_NAME/terraform-files"
        touch "$FOLDER_NAME/terraform-files/.gitkeep"
    fi
}

# Create course sections
create_section \
"01-understand-infrastructure-as-code-iac-concepts" \
"understand-infrastructure-as-code-iac-concepts" \
"no"

create_section \
"02-terraform-fundamentals" \
"terraform-fundamentals" \
"yes"

create_section \
"03-core-terraform-workflow" \
"core-terraform-workflow" \
"yes"

create_section \
"04-terraform-configuration" \
"terraform-configuration" \
"yes"

create_section \
"05-variables-precedence-and-data-types-with-handson" \
"variables-precedence-and-data-types-with-handson" \
"yes"

create_section \
"06-data-sources-functions-expressions-and-conditions" \
"data-sources-functions-expressions-and-conditions" \
"yes"

create_section \
"07-state-file-advance" \
"state-file-advance" \
"yes"

create_section \
"08-crucial-concepts" \
"crucial-concepts" \
"yes"

create_section \
"09-terraform-modules" \
"terraform-modules" \
"yes"

create_section \
"10-provisioners-good-to-know" \
"provisioners-good-to-know" \
"yes"

create_section \
"11-hcp-terraform" \
"hcp-terraform" \
"yes"

create_section \
"12-real-time-based-practice-test" \
"real-time-based-practice-test" \
"no"

# Create hands-on project folders
mkdir -p hands-on-projects/aws-vpc
mkdir -p hands-on-projects/aws-ec2
mkdir -p hands-on-projects/aws-s3
mkdir -p hands-on-projects/aws-3-tier-architecture

touch hands-on-projects/aws-vpc/.gitkeep
touch hands-on-projects/aws-ec2/.gitkeep
touch hands-on-projects/aws-s3/.gitkeep
touch hands-on-projects/aws-3-tier-architecture/.gitkeep

# Create .gitignore
cat > .gitignore <<'EOF'
# Terraform files
.terraform/
*.tfstate
*.tfstate.*
crash.log
crash.*.log

# Sensitive variable files
*.tfvars
*.tfvars.json

# Terraform override files
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# OS files
.DS_Store

# IDE files
.vscode/
.idea/
EOF

# Create README
cat > README.md <<'EOF'
# My Terraform Learning

This repository contains my notes, hands-on practice, and projects while preparing for the HashiCorp Certified: Terraform Associate (004) certification.

## Course Sections

1. Understand Infrastructure as Code (IaC) Concepts
2. Terraform Fundamentals
3. Core Terraform Workflow
4. Terraform Configuration
5. Variables Precedence and Data Types with Hands-on
6. Data Sources, Functions, Expressions & Conditions
7. State File Advance
8. Crucial Concepts
9. Terraform Modules
10. Provisioners — Good to Know
11. HCP Terraform
12. Real-Time Based Practice Test

## Learning Workflow

Udemy Lesson → Markdown Notes → Hands-on Practice → Interview Preparation

## Repository Includes

- Concise Terraform notes
- Memory tricks and acronyms
- Terraform commands
- Hands-on configuration files
- Interview questions and scenarios
- Troubleshooting notes
- Practical Terraform projects
EOF

# Display the created folder structure
echo ""
echo "Terraform learning repository created successfully!"
echo ""
echo "Repository structure:"
find . -not -path '*/.git/*' | sort