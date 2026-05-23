pipeline {
    agent any
    
    environment {
        APP_ENV = 'Staging'
        APP_VERSION = '1.3.0-RC'
    }
    
    stages {
        stage('Initialize & Lint') {
            steps {
                echo "Starting pipeline execution for Environment: ${env.APP_ENV}"
                echo "Target Application Version: ${env.APP_VERSION}"
            }
        }
        
        stage('Build & Package') {
            steps {
                echo "Compiling code dependencies..."
                // Simulate packaging artifact
                writeFile file: 'build_status.txt', text: "Version ${env.APP_VERSION} built successfully."
            }
        }
        
        stage('Security & Test Execution') {
            environment {
                // Binding the credential securely to an environment variable scoped only to this stage
                MY_SECRET_KEY = credentials('api-token-assignment')
            }
            steps {
                echo "Running unit and mock integration testing suites..."
                // TVET Practical checkpoint: Observe log masking
                echo "Validating authentication token status..."
                echo "The active system key is: ${MY_SECRET_KEY}" 
            }
        }
    }
    
    post {
        always {
            echo "Archiving operational build results..."
            archiveArtifacts artifacts: 'build_status.txt', fingerprint: true
        }
        success {
            echo "Pipeline complete. Notification sent to development team."
        }
        failure {
            echo "Alert! Pipeline failed at runtime. Check configurations."
        }
    }
}