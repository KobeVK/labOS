#!groovy

def mailTo = 'skvaknin@gmail.com'

pipeline {
	
	agent any
	parameters {
        choice(
            name: 'region',
            choices: ['eu-west-3', 'us-east-1', 'eu-west-1', 'ap-southeast-2'],
            description: 'Select region'
        )
        choice(
            name: 'ami',
            choices: ['ami-08c4559b664a2c695'],
            description: 'Select AMI'
        )
        choice(
            name: 'type',
            choices: ['t2.xlarge', 'm5.large', 'c5.xlarge', 'r5.4xlarge'],
            description: 'Select the insctance type'
        )
	}

	environment {
	  GIT_SSH_COMMAND = "ssh -o StrictHostKeyChecking=no"
	}

	options {
		timestamps()
	}

	stages {

		stage('starting-fresh') {
            steps {
                script {
                    deleteDir()
					cleanWs()
                    checkout scm
                }
            }
        }

		stage('Properties Set-up') {
			steps {
				script {
					properties([
						disableConcurrentBuilds()
					])
				}
			}
		}

		stage('deploy env') {
			steps {
                withAWS(credentials: 'aws-access-key') {
					script {
						env.prevent_destroy = "true"
							sh """
								echo "Starting Terraform init"
								terraform init
								terraform plan -out myplan -var="ami=${ami}" -var="region=${region}" -var="type=${type}"
								terraform apply -auto-approve -var="ami=${ami}" -var="region=${region}" -var="type=${type}"
							"""
					}
				}
			}
		}

		stage('print instance IP') {
			steps {
				withCredentials([sshUserPrivateKey(credentialsId: "sshUserPrivateKey", keyFileVariable: 'KEY')]) {
					script {
						access_ip = sh (
						script: """
							terraform output -raw web_app_access_ip
						""", returnStdout: true
						).trim()
						env.IP = access_ip
					}
				}
			}
		}
	}
}
