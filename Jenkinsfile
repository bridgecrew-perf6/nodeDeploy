pipeline {
    agent any 
    environment {
         SERVICE_NAME = "NodeJS Demo APP"
         
    }
    stages {
        stage('Build') { 
            steps {
             
            withCredentials([usernamePassword(credentialsId: 'DB_HOST', passwordVariable: 'value', usernameVariable: 'HOST')]) {

            sh 'echo $value'
            // also available as a Groovy variable
            echo HOST
            // or inside double quotes for string interpolation
            echo "username is $HOST"
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