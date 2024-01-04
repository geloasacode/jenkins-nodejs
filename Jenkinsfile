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
                    echo 'Dockerhub login ...'

                    //Docker login
                    def dockerLoginCmd = "echo $CREDENTIALS_DOCKER_PSW | docker login -u $CREDENTIALS_DOCKER_USR --password-stdin"
                    try {
                        sh dockerLoginCmd
                    } catch (Exception e) {
                        error("Docker login failed: ${e.message}")
                    }
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
    post {
        success {
            echo "Success: ${env.JOB_NAME} ${env.BUILD_NUMBER}\nCommit SHA: ${GITSHA}\n${BUILD_URL}"
        }
        failure {
            echo "Failure: ${env.JOB_NAME} ${env.BUILD_NUMBER}\nCommit SHA: ${gitCogitShammitSha}\n${BUILD_URL}"
        }
    }
}