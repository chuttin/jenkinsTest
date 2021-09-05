pipeline {
    agent none

    stages {
        stage('pull code') {
            agent any
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/chuttin/jenkinsTest.git']]])
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
                    docker.withRegistry('https://registry-1.docker.io/v2/', 'docker') {
                        docker.build("chuttin/jenkins_demo:${env.BUILD_ID}").push()
                    }
                }
            }
        }
    }
}
