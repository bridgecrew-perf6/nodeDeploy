pipeline {
    agent any 
    environment {
         SERVICE_NAME = "NodeJS Demo APP"
    }
    stages {
        stage('Build') { 
            steps {
                sh "make install"
            }
        }
        stage('Test') { 
            steps {
                sh "make tests"
            }
        }
        stage('Deployment') { 
            steps {
                // 
                sh "make pm2Start"
            }
        }
    }
}