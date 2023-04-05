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
                    echo "building image"
                    withCredentials ([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASS', usernameVariable: 'USER')])
                    sh 'docker build -t isrealurephu/demo-app:V1 .'
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker push isrealurephu/demo-app:V1"
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