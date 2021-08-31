pipeline {
    agent any

    stages {
        stage('pull code') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '1903b0e9-1b40-46c8-8579-147f15703c21', url: 'https://github.com/chuttin/jenkinsTest.git']]])
            }
        }
        stage('build') {
            steps {
                sh 'npm install'
            }
        }
        stage('test') {
            steps {
                sh 'npm run test'
            }
        }
        stage('docker push') {
            steps {
                input message: 'push to dockerHub?'
                script {
                    docker.build("jenkins_demo:${env.BUILD_ID}").push("chuttin/jenkins_demo:${env.BUILD_ID}")
                }
            }
        }
    }
}
