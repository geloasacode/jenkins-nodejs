pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the GitHub repository
                git 'https://github.com/geloasacode/jenkins-nodejs.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    def dockerImageTag = "myJenkinsNodeApp:${env.BUILD_NUMBER}"
                    docker.build(dockerImageTag, '.')
                    }
                }
            }
        }
    }
