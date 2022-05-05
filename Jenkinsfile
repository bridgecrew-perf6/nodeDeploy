pipeline {
    agent any 
    environment {
         SERVICE_NAME = "NodeJS Demo APP"
         
    }
    stages {
        stage('Build') { 
            steps {
             
                withCredentials([file(credentialsId: 'DB_CREDS', variable: 'DB_CREDS')]) {
                // some block
                echo "DISPLAYING ALL ENVIRONMENT VARIABLES...."
                echo "JWT_KEY: ${JWT_KEY}"
                echo "HOST: ${MONGODB_HOST}"
                echo "PASSWORD: ${MONGODB_HOST}"
                echo "#####Initiating Deployment "
        }
                sh "make install"
                //echo "Build"
            }
        }
        stage('Test') { 
            steps {
                sh "make tests"
               //echo "tests"
            }
        }
        stage('Deployment') { 
            steps {
                // 
               // sh "make pm2Start"
               // NODE_USER CREDS CHANGED 
                sshagent (credentials: ['296c36a7-2d0f-4201-8046-03465c8576d8']) { sh 'make deploy' }
            }
        }
    }
}