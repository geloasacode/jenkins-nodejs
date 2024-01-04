pipeline {
    agent any

    environment {
        GITSHA = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
        DOCKER_CREDENTIALS = credentials('dockerhub_id')
    }

    stages {
        stage('SCM Checkout') {
            steps {
                // Checkout the GitHub repository
                git branch: 'main', 
                url: 'https://github.com/geloasacode/jenkins-nodejs'
            }
        }

        stage('Build Docker Image') {
             steps{
                script {
                    echo 'Building Docker Image...'
                    // def gitSha = sh(script: 'git rev-parse --short HEAD', returnStdout: true)    
                    sh "docker build -t myjenkins-nodeapp:${GITSHA} ."
                }
             }
        }

        stage('Dockerhub login') {
            steps{
                script{
                    //Docker login
                    sh "echo \$DOCKER_CREDENTIALS_PSW | docker login -u \$DOCKER_CREDENTIALS_USR --password-stdin"
                }
            }
        }

        stage('Docker push') {
            steps{
                script{
                    echo 'Pushing Image ...'
                    sh "docker push gero001/myjenkins-nodeapp:${GITSHA}"
                }
            }
        }
    }
}