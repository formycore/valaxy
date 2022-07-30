pipeline
{
    agent none
    stages
    {
        stage('Check docker connection')
        {
            agent {label 'jendocker'}
            steps
            {
                sh 'hostname'
                sh 'ifconfig -a'
            }
        }
        stage('Check ansible connection')
        {
            agent {label 'jenansible'}
            steps
            {
                sh 'hostname'
                sh 'ifconfig -a'
            }
        }
    }
}