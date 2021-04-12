#!/usr/bin/groovy

pipeline {
    agent any

    options {
        disableConcurrentBuilds()
    }

    stages {

        stage("Build") {
            steps { buildApp() }
		}

        stage("Deploy - Dev") {
            steps { deploy('dev') }
		}

	}
}


// steps
def buildApp() {
	def appImage = docker.build("pipelearning/myapp:${BUILD_NUMBER}")
	
}

def deploy(environment) {

	def containerName = "pipeTest"
	def port = "8888"

	sh "docker ps -f name=${containerName} -q | xargs --no-run-if-empty docker stop"
	sh "docker ps -a -f name=${containerName} -q | xargs -r docker rm"
	sh "docker run -d -p ${port}:5000 --name ${containerName} hands-pipeLearning-jenkins/myapp:${BUILD_NUMBER}"

}
