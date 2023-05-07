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

            stage ("Provision server"){
                // this stage is to provsion the servers using terraform
            }

        stage("deploy") {
            
            steps {
                script {
                    def shellCmd =  'bash ./server-commands.sh'
                    sshagent(['applogin']) {
                     sh "scp -o StrictHostKeyChecking=no server-commands.sh  ubuntu@52.23.207.52:/home/ubuntu"
                     sh "scp -o StrictHostKeyChecking=no docker-compose/docker-compose.yaml ubuntu@52.23.207.52:/home/ubuntu"
                     sh "ssh -o StrictHostKeyChecking=no ubuntu@52.23.207.52 ${shellCmd}"  

                  }
                }
            }
        }
    }   
}
