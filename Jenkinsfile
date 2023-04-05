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
                    echo "building the application"
                    sh 'mvn package'
                    
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
                    echo "deploying"
                    //gv.deployApp()
                }
            }
        }
    }   
}