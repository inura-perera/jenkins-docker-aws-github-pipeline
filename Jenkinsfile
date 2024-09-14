pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'inura0924/pipeline:tagname'
        DOCKER_SERVER_IP = '18.141.160.73'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/inura-perera/jenkins-docker-aws-github-pipeline.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_HUB_REPO}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub_credentials') {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy Docker Container to Docker Server') {
            steps {
                sshagent(['docker-ssh-key']) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no ec2-user@${DOCKER_SERVER_IP} "
                        docker pull ${DOCKER_HUB_REPO} &&
                        docker stop flask-app || true &&
                        docker rm flask-app || true &&
                        docker run --name flask-app -d -p 5000:5000 ${DOCKER_HUB_REPO}"
                    '''
                }
            }
        }
    }
}
