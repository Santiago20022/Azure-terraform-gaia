first commit 



# 🚀 Jenkins in Docker with Automated Pipeline  

This project sets up a **Jenkins server in a Docker container**, using **Docker Compose** for infrastructure management and execution. It also implements an **automated CI/CD pipeline** defined in a `Jenkinsfile`.  

---

## 📌 Technologies Used  
- **Docker**: To containerize Jenkins and simplify installation.  
- **Docker Compose**: To define and manage containers.  
- **Jenkins**: A continuous integration and delivery (CI/CD) server.  
- **Groovy**: The language used in the `Jenkinsfile` to define the pipeline.  
- **Git**: To manage the code and connect Jenkins to the repository.  

---

## ⚙️ Installation and Execution Steps  

### 1️⃣ **Clone the repository**  
```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo


2️⃣ Create and start the Jenkins container
Run the following command to build and start the container:


docker-compose up -d
Check if the container is running with:


docker ps
3️⃣ Retrieve the Jenkins administrator password
To log in to Jenkins for the first time, you need the automatically generated password. Retrieve it by running:


docker exec -it jenkins-container cat /var/jenkins_home/secrets/initialAdminPassword
📌 Copy the password and paste it into the Jenkins login page.

4️⃣ Access Jenkins
Open your browser and go to:


http://localhost:8080
Log in using the retrieved password.

🔧 Jenkins Configuration
1️⃣ Install Required Plugins
Go to Manage Jenkins > Manage Plugins.
In the Available tab, install:
✅ Pipeline
✅ Docker Pipeline
✅ Git
Restart Jenkins if necessary.
2️⃣ Configure the Pipeline in Jenkins
In the Jenkins dashboard, click "New Item".
Enter a name for the Job (e.g., MyPipeline).
Select Pipeline and click OK.
Go to the Pipeline tab and in Definition, select Pipeline script from SCM.
Under SCM, choose Git and enter your repository URL.
In Branches to build, enter main or your branch name.
In Script Path, leave Jenkinsfile.
Save the configuration and run the pipeline.
📜 Pipeline Definition (Jenkinsfile)
This file defines the CI/CD pipeline with three basic stages:

```
    pipeline {
        agent any
        stages {
            stage('Build') {
                steps {
                    echo 'Building the application...'
                }
            }
            stage('Test') {
                steps {
                    echo 'Running tests...'
                }
            }
            stage('Deploy') {
                steps {
                    echo 'Deploying the application...'
                }
            }
        }
    }
```
📌 Explanation:

Build: Simulates the application build process.
Test: Simulates running tests.
Deploy: Simulates application deployment.
🔄 Automation with Scripts
To make managing Jenkins easier, two scripts have been created:

🟢 Start Script (start.sh)
This script automatically starts Jenkins:


#!/bin/bash
docker-compose up -d
echo "Jenkins is running at http://localhost:8080"
🔹 Make it executable and run it:


chmod +x start.sh
./start.sh
🔴 Stop Script (stop.sh)
To stop Jenkins easily:


#!/bin/bash
docker-compose down
echo "Jenkins has been stopped."
🔹 Make it executable and run it:


chmod +x stop.sh
./stop.sh
📂 Project Structure

📂 jenkins-container-pipeline/
│── 📜 docker-compose.yml       # Jenkins Docker configuration
│── 📜 Jenkinsfile              # Pipeline definition
│── 📜 start.sh                 # Script to start Jenkins
│── 📜 stop.sh                  # Script to stop Jenkins
│── 📜 README.md                # Project documentation
