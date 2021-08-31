pipeline {
    agent none

    stages {
        stage('pull code') {
            agent any
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '1903b0e9-1b40-46c8-8579-147f15703c21', url: 'https://github.com/chuttin/jenkinsTest.git']]])
            }
        }
        stage('build') {
            agent {
                docker { image 'node:12-alpine' }
            }
            steps {
                sh 'npm install'
            }
        }
        stage('test') {
            agent {
                docker { image 'node:12-alpine' }
            }
            steps {
                sh 'npm run test'
            }
        }
        stage('docker push') {
            agent any
            steps {
                input message: 'push to dockerHub?'
                script {
                    docker.build("jenkins_demo:${env.BUILD_ID}").push("chuttin/jenkins_demo:${env.BUILD_ID}")
                }
            }
        }
    }
}
