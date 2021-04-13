#!/usr/bin/groovy

pipeline {
    agent any

    stages {

        stage("Build") {
            steps { buildApp() }
		}

		stage("Test") {
			steps { runTest() }
		}

        stage("Deploy - Dev") {
            steps { deploy() }
		}

	}
}


// steps
def buildApp() {
	def appImage = docker.build("pipelearning/myapp:${BUILD_NUMBER}")
	
}

def deploy() {

	def containerName = "pipetest"
	def port = "8888"

	sh "docker ps -f name=${containerName} -q | xargs --no-run-if-empty docker stop"
	sh "docker ps -a -f name=${containerName} -q | xargs -r docker rm"
	sh "docker run -d -p ${port}:5000 --name ${containerName} pipelearning/myapp:${BUILD_NUMBER}"

}

def runTest() {
	withPythonEnv('python3') {
        	sh 'pip install pytest'
        	sh "pytest containerRunning.py"
    	}
	
}
