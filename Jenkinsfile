pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                checkout scm
            }
        }
        
        stage('Build and Push Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("pravidah/java-app:${env.BUILD_ID}")
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-creds') {
                        dockerImage.push()
                    }
                }
            }
        }
        
        stage('Deploy Docker Container') {
            steps {
                script {
                    def imageName = "pravidah/java-app:${env.BUILD_ID}"
                    // Pull and run the Docker container
                    docker.image(imageName).withRun('-p 8080:3000') {
                        // Additional setup or tests can be added here
                    }
                }
            }
        }
    }
}
