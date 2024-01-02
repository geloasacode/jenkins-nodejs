pipeline {
    agent any

    stages {
        stage('Checkout') {
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
                    def gitSha = sh ( script: 'git rev-parse --short HEAD', returnStdout: true)    
                    sh 'docker build -t myjenkin-nodeapp:${gitSha} .'
                }
             }
        }
    }
    post {
        success {
            echo "Success: ${env.JOB_NAME} ${env.BUILD_NUMBER}\nCommit SHA: ${gitSha}\n${BUILD_URL}"
        }
        failure {
            echo "Failure: ${env.JOB_NAME} ${env.BUILD_NUMBER}\nCommit SHA: ${gitCogitShammitSha}\n${BUILD_URL}"
        }
    }
}