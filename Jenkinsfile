pipeline {
    agent any 
    environment {
         SERVICE_NAME = "NodeJS Demo APP"
    }
    stages {
        stage('Build') { 
            environment {
		DB_HOST = credentials('MONGODB_HOST')
		DB_PASS = credentials('MONGODB_PASS')
        JWT_KEY = credentials('JWT_KEY')
		
      }
            steps {
                echo "DISPLAYING ALL ENVIRONMENT VARIABLES...."
                echo "JWT_KEY: ${JWT_KEY}"
                echo "HOST: ${DB_HOST}"
                echo "PASSWORD: ${DB_PASS}"
                echo "#####Initiating Deployment "
                sh "make install"
             //   withCredentials([usernamePassword(credentialsId: 'DB_HOST', passwordVariable: 'DB_PASS', usernameVariable: 'DB_HOST')]) {
                // the code here can access $pass and $user
                //sh 'echo $DB_PASS'
                // also available as a Groovy variable
                //echo DB_HOST
                // or inside double quotes for string interpolation
               // echo "username is $DB_HOST"
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