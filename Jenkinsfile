
pipeline{
    agent { node { label 'slave1'} }
    stages{
        stage("Git Checkout"){
            steps {
            git credentialsId: 'github_key', url: 'https://github.com/sarab321/JenkinsPipeline'
        }
        }
        stage("Terraform Init"){
            steps{
            sh 'terraform init'
            }
        }
        stage("Terraform Plan"){
            steps{
            sh 'terraform plan'
        }
        }
        stage("Deploy - Approval"){
            when {
                expression { params.REQUESTED_ACTION == 'Deploy'}
            }
            steps{
            sh 'terraform apply --auto-approve'
        }
        }

        stage("Deploy - Approval"){
            when {
                expression { params.REQUESTED_ACTION == 'Destroy'}
            }
            steps{
            sh 'terraform destroy --auto-approve'
        }
        }
    }
}