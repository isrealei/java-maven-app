def gv

pipeline {
    agent any
    tools {
        maven "MAVEN3"
    }
    stages {
        stage("init") {
          
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("build jar") {

            steps {
                script {
                   gv.buildJar()
                    
                }
            }
        }

        stage("build image") {
            
            steps {
                script {
                    gv.buildImage()

                    }
                 
                }
            }

        stage("deploy") {
            
            steps {
                script {
                    def shellCmd =  'bash ./server-commands.sh'
                    sshagent(['applogin']) {
                     sh "scp -o StrictHostKeyChecking=no server-commands.sh  ubuntu@3.83.91.200:/home/ubuntu"
                     sh "scp -o StrictHostKeyChecking=no docker-compose/docker-compose.yaml ubuntu@3.83.91.200:/home/ubuntu"
                     sh "ssh -o StrictHostKeyChecking=no ubuntu@3.83.91.200 ${shellCmd}"  

                  }
                }
            }
        }
    }   
}
