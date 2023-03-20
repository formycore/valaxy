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
             
            }
        }
        stage ("Sonar scanner"){
            steps {
                sh 'mvn sonar'
            }
        }
    }
}