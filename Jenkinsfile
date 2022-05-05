pipeline {
    agent any 
    environment {
         SERVICE_NAME = "NodeJS Demo APP"
         
    }
    stages {
        stage('Build') { 
    environment {
         SECRET_FILE_ID = credentials('DB_CREDS')
         DB_HOST = credentials('MONGODB_HOST')
    }
            steps {
                echo "DISPLAYING ALL ENVIRONMENT VARIABLES...."
                echo "JWT_KEY: ${JWT_KEY}"
                echo "HOST: ${DB_HOST}"
                echo "PASSWORD: ${DB_PASS}"
                echo "#####Initiating Deployment "
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