# 🚀 Creating a Full CI/CD Pipeline on AWS with Jenkins, GitHub, Docker, Terraform, and Slack

## Introduction

In this project, I built a complete CI/CD pipeline that automates the process of building, testing, and deploying a Node.js web application on AWS.

The main goal of this project was to learn and implement DevOps practices by integrating GitHub, Jenkins, Docker, Terraform, and Slack into a single automated workflow.

Whenever code is pushed to GitHub, Jenkins automatically triggers the pipeline, performs the required checks, builds the Docker image, deploys the application, and sends notifications to Slack.

---

## 🛠️ Technologies Used

* AWS EC2
* AWS S3
* Terraform
* Jenkins
* Docker
* GitHub
* Slack
* Node.js
* Shell Scripting

---

# 1. Project Setup and Dockerization

The first step was setting up the Node.js application and containerizing it using Docker.

### Clone the Repository

```bash
git clone <repository-url>
cd nodejs-web-app
```

### Install Dependencies

```bash
npm install
```

### Run the Application Locally

```bash
npm start
```

### Dockerizing the Application

A Dockerfile was created to package the application along with its dependencies.

```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]
```

### Build the Docker Image

```bash
docker build -t nodejs-web-app .
```

### Run the Container

```bash
docker run -d -p 3000:3000 nodejs-web-app
```

This ensures the application can run consistently across different environments without any dependency-related issues.

---

# 2. Setting Up Slack and Creating a Bot

Slack was integrated into the project to receive real-time notifications about build and deployment activities.

### Steps Followed

1. Created a Slack workspace.
2. Created a dedicated channel for Jenkins notifications.
3. Created a new Slack App.
4. Enabled the Bot User feature.
5. Added the required OAuth permissions:

   * `chat:write`
   * `channels:read`
   * `groups:read`
6. Installed the application in the workspace.
7. Generated the Bot User OAuth Token.
8. Added the bot to the notification channel.

Example command:

```text
/invite @jenkins-bot
```

The Slack token was then configured inside Jenkins so that build and deployment updates could be sent automatically.

---

# 3. AWS Infrastructure Setup Using Terraform

Instead of manually creating AWS resources, Terraform was used to provision the infrastructure as code.

### Infrastructure Components

The Terraform configuration creates:

* Jenkins Server
* Application Server
* Security Groups
* S3 Buckets
* IAM Roles and Policies
* Networking Resources

### Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Validate Configuration:

```bash
terraform validate
```

Review Planned Changes:

```bash
terraform plan
```

Create Infrastructure:

```bash
terraform apply
```

Remove Infrastructure:

```bash
terraform destroy
```

Using Terraform makes the infrastructure reproducible, scalable, and easy to manage.

---

# 4. Jenkins and Web App User Data Configuration

To automate server provisioning, User Data scripts were used during EC2 instance creation.

## Jenkins Server Setup

The Jenkins User Data script performs the following tasks automatically:

* Updates the operating system
* Installs Git
* Installs Java
* Installs Jenkins
* Installs Docker
* Configures AWS CLI
* Downloads Jenkins configuration files
* Creates Jenkins credentials
* Configures the CI/CD pipeline

### Starting Jenkins

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

### Starting Docker

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

---

## Application Server Setup

The application server User Data script prepares the server for deployment.

It performs tasks such as:

* Installing Docker
* Pulling application code
* Building Docker images
* Running containers
* Preparing the environment for deployments

Example:

```bash
docker build -t nodejs-web-app .
docker run -d -p 3000:3000 nodejs-web-app
```

---

# 🔄 CI/CD Workflow

The complete workflow follows these steps:

1. A developer pushes code to GitHub.
2. GitHub triggers the Jenkins pipeline.
3. Jenkins pulls the latest source code.
4. Automated tests are executed.
5. Security and quality checks are performed.
6. A Docker image is built.
7. The application is deployed to the target environment.
8. Slack notifications are sent to report the pipeline status.

This process removes manual deployment steps and helps maintain consistency across releases.

---

# 📁 Project Structure

```text
## 📁 Project Structure

```text
project-root/
│
├── Dockerfile
├── Dockerfile.test
├── Jenkinsfile
│
├── server/
│   ├── package.json
│   ├── package-lock.json
│   ├── src/
│   ├── tests/
│   └── application source code
│
└── terraform/
    │
    ├── application-server/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── user_data.sh
    │
    ├── jenkins-server/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── user_data.sh
    │
    ├── jenkins-config/
    │   ├── create_admin_user.sh
    │   ├── create_credentials.sh
    │   ├── create_multibranch_pipeline.sh
    │   └── plugin configuration scripts
    │
    ├── application.tf
    ├── ecr.tf
    ├── iam.tf
    ├── jenkins.tf
    ├── key-pairs.tf
    ├── networking.tf
    ├── providers.tf
    ├── random.tf
    ├── s3.tf
    ├── secrets.tf
    ├── variables.tf
    └── terraform.tfvars
```


---

# 🎯 Conclusion

This project demonstrates how different DevOps tools can work together to automate the software delivery process.

By combining GitHub, Jenkins, Docker, Terraform, AWS, and Slack, the entire deployment workflow becomes faster, more reliable, and easier to manage.

The project also provides hands-on experience with Infrastructure as Code (IaC), Continuous Integration (CI), and Continuous Deployment (CD), which are essential skills for modern DevOps and Cloud Engineers.
