
pipeline{
    agent { node { label 'slave1'} }

    parameters {
        choice (
            choices: ['Deploy' , 'Destroy'],
            description: 'Which action?',
            name: 'REQUESTED_ACTION')
    }

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
            sh 'terraform plan -out=tfplan'
        }
        }
        stage("Deploy - Approval"){
            when {
                expression { params.REQUESTED_ACTION == 'Deploy'}
            }
            steps{
            sh 'terraform apply tfplan'
        }
        }

        stage("Destroy - Approval"){
            when {
                expression { params.REQUESTED_ACTION == 'Destroy'}
            }
            steps{
            sh 'terraform destroy tfplan'
        }
        }
    }
}


