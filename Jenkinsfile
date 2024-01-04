pipeline {
    agent any

    environment {
        GITSHA = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
        CREDENTIALS_DOCKER = credentials('dockerhub_id')
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
                    echo 'Before withCredentials'
                    withCredentials([usernamePassword(credentialsId: 'dockerhub_id', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
                    }
                    echo 'After withCredentials'
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