pipeline {
    agent any 
    stages {
        stage("code") {
            steps {
                echo "Clonning the code" 
                git url:"https://github.com/hazratalithkoeln/nodejsapplication.git", branch:"main"
            }
        }
        stage("build") {
            steps {
                echo "Building the image" 
                sh "docker build -t my-node-app ."
            }
        }
        stage("push to Dockerhub") {
            steps {
                echo "Pushing the image to Docker Hub"
                withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker tag my-node-app ${dockerHubUser}/my-node-app:latest"
                    sh "docker push ${dockerHubUser}/my-node-app:latest"
                }
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploying the container" 
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
