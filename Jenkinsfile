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
                script{
                    sh '''
                    echo 'Buid Docker Image'
                    docker build -t myjenkin-nodeapp:${BUILD_NUMBER} .
                    '''
                 }
             }
            // steps {
            //     script {
            //         // Build Docker image
            //         def dockerImageTag = "myJenkinsNodeApp:${env.BUILD_NUMBER}"
            //         docker.build(dockerImageTag, '.')
            //         }
            //     }
            // }
        }
    }
}