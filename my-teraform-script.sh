#!/bin/bash

# Repository name
REPO_NAME="my-terraform-learning"

# Create repository directory
mkdir -p "$REPO_NAME"
cd "$REPO_NAME" || exit 1

# Initialize Git
git init

# Create root files
touch README.md LICENSE .gitignore

# Function to create a topic folder and matching notes file
create_topic() {
    FOLDER="$1"
    FILE="$2"

    mkdir -p "$FOLDER"
    touch "$FOLDER/$FILE"
}

# Create course sections
create_topic "01-introduction-to-terraform" "introduction-to-terraform.md"

create_topic "02-terraform-setup-and-basics" "terraform-setup-and-basics.md"

create_topic "03-terraform-core-workflow" "terraform-core-workflow.md"

create_topic "04-terraform-configuration" "terraform-configuration.md"

create_topic "05-variables-and-meta-arguments" "variables-and-meta-arguments.md"

create_topic "06-expressions-and-data-sources" "expressions-and-data-sources.md"

create_topic "07-state-management" "state-management.md"

create_topic "08-debugging-and-troubleshooting" "debugging-and-troubleshooting.md"

create_topic "09-modules-and-workspaces" "modules-and-workspaces.md"

create_topic "10-provisioners" "provisioners.md"

create_topic "11-hcp-terraform-cloud" "hcp-terraform-cloud.md"

create_topic "12-exam-preparation" "exam-preparation.md"

# Create practical Terraform directories
PRACTICE_DIRS=(
    "02-terraform-setup-and-basics/terraform-files"
    "03-terraform-core-workflow/terraform-files"
    "04-terraform-configuration/terraform-files"
    "05-variables-and-meta-arguments/terraform-files"
    "06-expressions-and-data-sources/terraform-files"
    "07-state-management/terraform-files"
    "08-debugging-and-troubleshooting/terraform-files"
    "09-modules-and-workspaces/terraform-files"
    "10-provisioners/terraform-files"
    "11-hcp-terraform-cloud/terraform-files"
)

for DIR in "${PRACTICE_DIRS[@]}"; do
    mkdir -p "$DIR"
    touch "$DIR/.gitkeep"
done

# Create hands-on project directories
PROJECTS=(
    "aws-vpc"
    "aws-ec2"
    "aws-s3"
    "aws-3-tier-architecture"
)

for PROJECT in "${PROJECTS[@]}"; do
    mkdir -p "hands-on-projects/$PROJECT"
    touch "hands-on-projects/$PROJECT/.gitkeep"
done

# Create .gitignore
cat > .gitignore <<'EOF'
# Terraform state
*.tfstate
*.tfstate.*

# Terraform working directory
.terraform/

# Sensitive files
*.tfvars
*.tfvars.json

# Crash logs
crash.log
crash.*.log

# Local override files
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Keep the dependency lock file
# .terraform.lock.hcl should be committed
EOF

# Create README
cat > README.md <<'EOF'
# My Terraform Learning

My personal Terraform learning journey.

## Contents

- Terraform Associate (004) preparation
- Concise notes and definitions
- Acronyms and memory tricks
- Hands-on Terraform practice
- Interview preparation
- Troubleshooting scenarios
- Real-world infrastructure projects

## Learning Approach

Udemy Lesson → Notes → Hands-on Practice → Interview Preparation
EOF

echo ""
echo "✅ Repository structure created successfully!"
echo "📂 Location: $(pwd)"
echo ""
echo "📁 Repository structure:"
find . -not -path './.git/*' | sort