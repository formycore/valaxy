// original https://github.com/vikash-kumar01/mrdevops_java_app.git
@Library ('my-shared-library') _ 
// under the config system, we have mentioned the resusable repo , we have mentioned the 
// name,url and branch paths here
// space and _ are used to pull all the functions 
pipeline {
    agent any
    parameters {
        //choice (name:'actions', choices: 'create\ndelete', description: 'Choose Create or Delete')
        choice(name: 'action', choices: 'create\ndelete', description: 'Choose create/Destroy')
    }
    stages {
        stage ('Git Checkout'){
            when { expression {  params.action == 'create' } }
            steps {
                    // git 'https://github.com/formycore/shared_jenkins_lbs_project.git'
                    // name of the function is gitCheckout
                    // we have passed 2 variables github branch and url
                    gitCheckout (
                        branch: "master",
                        // url for the java app
                        //url: "https://github.com/formycore/shared_jenkins_lbs_project.git"
                       url: "https://github.com/formycore/github_actions_java_techie.git"
                    )
                
            }
        }
        stage ('Mvn test'){
            when { expression {  params.action == 'create' } }

            steps {
                script {
                mvnTest()
                }
            }
        }
        stage ('Maven Integration Test'){
            when { expression {  params.action == 'create' } }
            steps {
                script {
                mvnIntegrationTest()
                
                }
            }
        }
        stage ('Static code analysis') {
            when { expression {  params.action == 'create' } }
            steps {
                script {
                    def SonarQubecredentialsId = 'sonarqube-apia'
                    staticCodeAnalysis(SonarQubecredentialsId)
                }
            }
        }
        stage ('Quality Gate Check') {
            when { expression {  params.action == 'create' } }
            steps {
                script {
                    def SonarQubecredentialsId = 'sonar-apic'
                    QualityGateStatus(SonarQubecredentialsId)
                }
            }
        }
        stage ('Maven Build') {
            when { expression {  params.action == 'create' } }
            steps {
                script {
                    mvnBuild()
                }
            }
        }
    }
}%