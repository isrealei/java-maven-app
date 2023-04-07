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
                    def dockerCmd =  'docker run -d -p 8090:8090 isrealurephu/lifedelight-app:V18'
                    sshagent(['applogin']) {
                     sh "ssh -o StrictHostKeyChecking=no ubuntu@3.95.164.52 ${dockerCmd}"  

                  }
                }
            }
        }
    }   
}
