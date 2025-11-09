pipeline {
    agent any

    environment {
        IMAGE_NAME = "lokeshreddy56/shopping-cart"  // Docker Hub repo
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/LokeshReddie456/shopping-cart.git'
            }
        }

        stage('Build & Test Java App') {
            steps {
                echo 'Building and testing the Java application...'
                sh './mvnw clean package -DskipTests=false'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub',
                                                  usernameVariable: 'lokeshreddy56',
                                                  passwordVariable: '@Samsunggalaxy456')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                sh 'docker push $IMAGE_NAME:latest'
            }
        }
    }

    post {
        always {
            echo 'Logging out from Docker...'
            sh 'docker logout || true'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!!!!'
        }
    }
}
