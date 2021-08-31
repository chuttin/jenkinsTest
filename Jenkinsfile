pipeline {
    agent none

    stages {
        stage('pull code') {
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
            steps {
                input "push to dockerHub?"
                def customImage = docker.build("jenkinsDemo:${env.BUILD_ID}")
                customImage.push()
            }
        }
    }
}
