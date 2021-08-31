pipeline {
    agent any
    // environment {
        // env1 = 'pipeline env'
        // CC = """${sh(
        //         returnStdout: true,
        //         script: 'echo "clang"'
        //     )}""" 
        // EXIT_STATUS = """${sh(
        //         returnStatus: true,
        //         script: 'exit'
        //     )}"""
    //     github_token = credentials('githubtoken')
    //     user_password = credentials('c2b08cbf-bbb3-49fa-a753-c14913af9648')
    // }
    parameters {
        string(name: 'Greeting', defaultValue: 'Hello', description: 'How should I greet the world?')
    }

    stages {
        stage('pull code') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '1903b0e9-1b40-46c8-8579-147f15703c21', url: 'https://github.com/chuttin/jenkinsTest.git']]])
            }
        }
        // stage('env') {
        //     environment {
        //         env2 = 'stage env'
        //     }
        //     steps {
        //         sh 'printenv'
        //         echo "++++++${user_password_USR}+++++${user_password_PSW}++++"
        //     }
        // }
        stage('get params') {
            steps {
                echo "++++++${Greeting}+++++"
                sh 'printenv'
            }
        }
    }
}
