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
                steps {
                    script {
                        dir('terraform') {
                            sh "terraform init"
                            sh "terraform apply -auto-approve"
                            EC2_PUBLIC_IP = sh(
                                script: "terraform output server-ip"
                                returnStdout: true
                                ).trim()
                        }
                    }
                }
            }

        stage("deploy") {
            
            steps {
                script {
                    ehco "waiting for EC2 server to initialize"
                    sleep(time:90, unit: "SECONDS")
                    def shellCmd =  'bash ./server-commands.sh'
                    sshagent(['applogin']) {
                     sh "scp -o StrictHostKeyChecking=no server-commands.sh  ec2-user@${EC2_PUBLIC_IP}:/home/ec2-user"
                     sh "scp -o StrictHostKeyChecking=no docker-compose/docker-compose.yaml ec2-user@${EC2_PUBLIC_IP}:/home/ec2-user"
                     sh "ssh -o StrictHostKeyChecking=no ec2-user@${EC2_PUBLIC_IP} ${shellCmd}"  

                  }
                }
            }
        }
    }   
}
