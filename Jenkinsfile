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
        stage("Terraform Apply"){
            steps{
            sh 'terraform apply --auto-approve'
        }
        }

        stage("Terraform Destroy"){
            steps{
            sh 'terraform destroy --auto-approve'
        }
        }
    }
}
