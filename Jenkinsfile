pipeline {
    agent any
    
    /*
    tools {
        terraform 'terraform-1.x'
    }
    */
    
    stages {
        // --- STAGING LIFECYCLE STAGES ---
        stage('Staging: Initialize') {
            steps {
                dir('lab4/environments/staging') {
                    bat 'terraform init'
                }
            }
        }
        
        stage('Staging: Validate & Apply') {
            steps {
                dir('lab4/environments/staging') {
                    echo "Deploying infrastructure adjustments to Staging environment..."
                    bat 'terraform plan -out=stgplan'
                    bat 'terraform apply -input=false stgplan'
                }
            }
        }
        
        // --- ENTERPRISE MANUAL PROMOTION GATEWAY ---
        stage('Production Promotion Gate') {
            steps {
                echo "Staging checks completed successfully."
                input message: "Promote infrastructure alterations directly into the LIVE Production Environment?", 
                      ok: "Approve Production Release"
            }
        }
        
        // --- PRODUCTION LIFECYCLE STAGES ---
        stage('Production: Initialize') {
            steps {
                dir('lab4/environments/production') {
                    bat 'terraform init'
                }
            }
        }
        
        stage('Production: Secure Apply') {
            steps {
                dir('lab4/environments/production') {
                    echo "Executing production mutations..."
                    bat 'terraform plan -out=prodplan'
                    bat 'terraform apply -input=false prodplan'
                }
            }
        }
    }
    
    post {
        always {
            echo "Archiving operational multi-stage telemetry..."
            archiveArtifacts artifacts: 'environments/**/*.txt', allowEmptyArchive: true
        }
    }
}