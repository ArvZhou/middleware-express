pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
        stage('Run Docker') {
            steps {
                sh ./deploy.sh
            }
        }
    }
}