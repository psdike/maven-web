pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                sh 'git clone https://github.com/psdike/maven-web.git'
                sh 'ls -la'
            }
        }
        stage('create image') {
            steps {
                
                sh 'docker build -t maven .'
                sh 'ls -la'
            }
        }
        stage('creating container') {
            steps {
                
                sh 'docker run -itd -p 80:80 maven'
                
            }
        }
        stage('running container') {
            steps {
                
                sh 'check running container here http://172.16.86.134'
                
            }
        }
    }
}
