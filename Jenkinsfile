pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'shivamsoundale765/ci-cd-pipeline:latest'  // Using your Docker Hub username
    }
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/saundale/ci-cd-pipeline.git'  // Using your GitHub username
            }
        }
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package -DskipTests'  // Skipping tests if unnecessary
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {  
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}

