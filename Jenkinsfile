pipeline {
    agent {label 'Prod'}
    

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/ysyff/simple-apps.git'
            }
        }
        stage('Build') {
            steps {
                sh '''cd apps
                npm install'''
            }
        }
        stage('Testing') {
            steps {
                sh '''cd apps
                npm test
                npm run test:coverage'''
            }
        }
        stage('Code Review') {
            steps {
                sh '''sonar \\
                    -Dsonar.host.url=http://172.23.12.114:9000 \\
                    -Dsonar.token=sqp_79abf6b01854e03520da94cb17adbeaad16cfa89 \\
                    -Dsonar.projectKey=simple-apps'''
            }
        }
        stage('Deploy compose') {
            steps {
                sh '''
                docker compose build
                docker compose up -d
                '''
            }
        }
    }
}