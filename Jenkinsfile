pipeline{
    options{
         buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
    agent any
    stages{
       stage('Pull from scm'){
            steps{
                 git branch: 'master', credentialsId: 'myCreds', url: 'https://github.com/armelsteve/kraken-test.git'
            }
       }
       stage('build image'){
            steps{
                  sh 'docker build -t litecoin:latest .'
            }
       }
       stage('push image'){
            steps{
                  sh 'docker push litecoin:latest'
            }
       }
       stage('Deploy kubernetes app'){
            steps{
                  sh 'kubectl apply -f StatefulSet.yaml'
            }
       }
    }
    post{
        success{
            deleteDir()
        }
        failure{
            deleteDir()
        }
    }
}