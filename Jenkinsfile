node {
    stage ('Checkout'){
        git 'https://github.com/formycore/valaxy.git'
    }
    stage ('Maven'){
        // under the pipeline syntax, tools: use a tool for predefined tool installation
        def mvnHome = tool name: 'Maven', type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        //sh 'mvn clean package'
        // $ always should be ""
        sh "${mvnCMD} clean package"
        }
    stage ('Building Docker image'){
        // need to login to docker hub to push to docker hub
        // we can use docker login -u <username> -p <password> but password we cannot put here in the 
        // plain text we use binding the credentials(withCredentials) use secret text
        withCredentials([string(credentialsId: 'pwd', variable: 'dokcerHubPwd')]) {
        sh 'docker build -t formycore/intel123:1.0 .'
        sh "docker login -u formycore -p ${dokcerHubPwd}"
        sh "docker push formycore/intel123:1.0"
    }   
    }
    stage ('Run this docker container'){
        // we can run this on the remote server with sshAgent 
        // Install sshAgent plugin
        def dockerRun = 'docker run -p 8081:8080 -d --name myapp formycore/intel123:1.0'
        sshagent(['sshdocker']) {
        sh "ssh -o StrictHostKeyChecking=no maanya@10.128.0.4 ${dockerRun}"
    }
    }
}
