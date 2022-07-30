pipeline 
{
    agent none
    stages
    {
        stage('Hello')
        {
            agent {label 'jendocker'}
            steps
            {
                sh '''
                touch file.txt
                mkdir -p target
                touch target/file.txt
                sudo yum install tree -y
                tree
                '''
                stash(name: 'jenkins-stash')
            }
        }
        stage ('check the files')
        {
            agent {label 'jenansible'}
            steps
            {
                unstash 'jenkins-stash'
                sh 'tree'
            }
        }
    }
}