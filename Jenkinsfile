pipeline {
    agent any

    environment {
        APP_NAME = 'flask-orders-service'
        DOCKER_IMAGE = "kalaivani19/${APP_NAME}"
    }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Test Application') {
            steps {
                script {
                    // Run the container to test the application
                    sh "docker run -d -p 5000:5000 --name ${APP_NAME} ${DOCKER_IMAGE}"
                    
                    // Test the endpoint
                    sh "sleep 5" // Wait for the container to start
                    sh "curl -f http://localhost:5000/api/v1/orders/getOrders"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to DockerHub
                    withCredentials([string(credentialsId: 'dockerhub-credentials', variable: 'DOCKERHUB_PASS')]) {
                        sh "echo ${DOCKERHUB_PASS} | docker login -u kalaivani19 --password-stdin"
                    }
                    
                    // Push the Docker image
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    // Stop and remove the container
                    sh "docker stop ${APP_NAME}"
                    sh "docker rm ${APP_NAME}"
                    
                    // Remove the Docker image
                    sh "docker rmi ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}
 
