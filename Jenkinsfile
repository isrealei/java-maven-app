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
            When {
                expression {
                    BRANCH_NAME == 'master'
                }
            }
            steps {
                script {
                   gv.buildJar()
                    
                }
            }
        }

        stage("build image") {
            When {
                expression {
                    BRANCH_NAME == 'master'
                }
            }
            steps {
                script {
                    gv.buildImage()

                    }
                 
                }
            }

        stage("deploy") {
            When {
                expression {
                    BRANCH_NAME == 'master'
                }
            }
            steps {
                script {
                    echo "deploying artifact"
                    //gv.deployApp()
                }
            }
        }
    }   
}