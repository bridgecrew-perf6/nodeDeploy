pipeline {
    agent any 
    environment {
         SERVICE_NAME = "NodeJS Demo APP"
    }
    stages {
        stage('Build') { 
            steps {
                sh "make install"
                withCredentials([usernamePassword(credentialsId: 'DB_HOST', passwordVariable: 'DB_PASS', usernameVariable: 'DB_HOST')]) {
    // the code here can access $pass and $user
                sh 'echo $DB_PASS'
                // also available as a Groovy variable
                echo DB_HOST
                // or inside double quotes for string interpolation
                echo "username is $DB_HOST"
}
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