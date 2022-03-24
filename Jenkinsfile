pipeline {
    agent any 
    environment {
         SERVICE_NAME = "NodeJS Demo APP"
    }
    stages {
        stage('Build') { 
            steps {
                //sh "make install"
                echo "Build"
            }
        }
        stage('Test') { 
            steps {
               // sh "make tests"
               echo "tests"
            }
        }
        stage('Deployment') { 
            steps {
                // 
               // sh "make pm2Start"
                sshagent (credentials: ['NODE_USER']) { sh 'make check' }
            }
        }
    }
}