#!/usr/bin/groovy
pipeline{
    agent any

    stages{
        stage("Build"){
            steps{
                echo 'Building'
                build()
            }
        }

        stage("Deploy"){
            steps{
                echo 'Deploying'
                deploy()
            }
        }

    }
}

def build(){
    def appImage = docker.build("JenkinsLearning/app:$BUILD_NUMBER")
}

def deploy(){
    def containerName="TestContainer"
    def port = "8888"

    sh "docker ps -f name=${containerName} -q | xargs --no-run-if-empty docker stop"
	sh "docker ps -a -f name=${containerName} -q | xargs -r docker rm"
	sh "docker run -d -p ${port}:5000 --name ${containerName} hands-on-jenkins/myapp:${BUILD_NUMBER}"
}