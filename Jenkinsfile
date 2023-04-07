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
                    def dockerCmd =  'docker-compose -f docker-compose/docker-compose.yaml up -d'
                    sshagent(['applogin']) {
                     sh "scp -o StrictHostKeyChecking=no docker-compose/docker-compose.yaml ubuntu@54.146.216.116:/home/ubuntu"
                     sh "ssh -o StrictHostKeyChecking=no ubuntu@54.146.216.116 ${dockerCmd}"  

                  }
                }
            }
        }
    }   
}
