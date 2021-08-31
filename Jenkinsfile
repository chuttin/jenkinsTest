pipeline {
    agent any
    environment {
        env1 = 'pipeline env'
        CC = """${sh(
                returnStdout: true,
                script: 'echo "clang"'
            )}""" 
        EXIT_STATUS = """${sh(
                returnStatus: true,
                script: 'exit'
            )}"""
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
                echo "${env.env1}"
                sh 'printenv'
            }
        }
    }
}
