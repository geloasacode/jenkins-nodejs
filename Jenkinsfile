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
                    echo 'Build Docker Image'
                    try {
                        // Your build steps here
                        sh 'docker build -t myjenkin-nodeapp:${BUILD_NUMBER} .'

                        // Send email on success
                        currentBuild.result = 'SUCCESS'
                    } catch (Exception e) {
                        // Handle failure if needed
                        currentBuild.result = 'FAILURE'
                        throw e
                    }
                }
             }
        }
    }
    post {
        success {
            emailext body: "Success: ${env.JOB_NAME} ${env.BUILD_NUMBER}\n${BUILD_URL}",
                      subject: "Success: ${env.JOB_NAME} ${env.BUILD_NUMBER}",
                      to: 'gelodungo@gmail.com',
                      attachLog: true
        }
    }
}