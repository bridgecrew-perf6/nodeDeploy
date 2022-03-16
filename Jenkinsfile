pipeline {
    agent any 
    environment {
         SERVICE_NAME = "NodeJS Demo APP"
    }
    stages {
        stage('Testing') { 
            steps {
                sh "make tests"
            }
        }
        stage('Build') { 
            steps {
                sh "make install"
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