def buildJar() {
    echo "building the application..."
    sh 'mvn package'
} 

def buildImage() {
    echo "building the docker image..."
   echo "building image"
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
          sh 'docker build -t isrealurephu/demo-app:V1 .'
          sh "echo $PASS | docker login -u $USER --password-stdin"
          sh "docker push isrealurephu/demo-app:V1"
    }
} 

def deployApp() {
    echo 'deploying the application...'
} 

return this