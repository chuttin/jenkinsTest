pipeline {
    agent any
    environment {
        env1 = 'pipeline env'
    }

    stages {
        stage('pull code') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/${branch}']], extensions: [], userRemoteConfigs: [[credentialsId: '1903b0e9-1b40-46c8-8579-147f15703c21', url: 'https://github.com/chuttin/jenkinsTest.git']]])
            }
        }
        stage('env') {
            environment {
                env2 = 'stage env'
            }
            steps {
                sh 'echo env.env1'
                sh 'echo env.env2'
                sh 'printenv'
            }
        }
        stage('get env') {
            steps {
                sh 'echo env.env1'
                sh 'echo env.env2'
                sh 'printenv'
            }
        }
    }
}
