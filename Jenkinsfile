// how to find the ipaddress of the slave in jenkins pipeline
// https://stackoverflow.com/questions/5272489/how-to-find-the-ipaddress-of-the-slave-in-jenkins-pipeline
pipeline {
    agent {
        label "jendocker"
    }
    stages {
        stage('Build') {
            steps {
                sh "ifconfig -a | grep inet | grep -v"
            }
        }
    }
}