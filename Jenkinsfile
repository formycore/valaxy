pipeline {
    agent any
    tools {
        maven 'maven3'
    }
    stages {
        stage ("code check"){
            steps {
                git 'https://github.com/formycore/valaxy.git'
                stash 'source'
            }
        }
        stage ("Maven Build") {
            agent {
                label 'docker'
            }
            steps {
                unstash 'source'
               sh 'mvn clean install'
               sh "cp $pwd/workspace/test/webapp/target/*.war /home/maanya/doc/"
                sh "docker image build -t $JOB_NAME:v1.$BUILD_ID ."
                sh "docker image tag $JOB_NAME:v1.$BUILD_ID formycore/$JOB_NAME:v1.$BUILD_ID"
                sh "docker image tag $JOB_NAME:v1.$BUILD_ID formycore/$JOB_NAME:latest"

              
            }
        }
        stage ("Sonar scanner"){
            steps {
                sh 'mvn sonar'
            }
        }
    }
}