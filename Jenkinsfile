pipeline {
 agent any;
 stages {
   stage('Preparing the Environment') {
    steps {
     sh 'python3 -m pip install -r requirements.txt'
    }
   }
   stage('Code Quality') {
    steps {
     sh 'python3 -m pylint app.py'
} }
   stage('Tests') {
    steps {
     sh 'python3 -m pytest'
    }
   }
   stage('Build') {
      agent {
         node {
            label 'Dockerserver';
         }
      }
      steps{
      sh 'docker build
     https://github.com/AsyncDeveloper245/cloud-devops-materials.git -t
     myapp:latest'
      }
   }
   stage('Deploy') {
      agent {
         node {
            label 'Dockerserver';
         }
      }
    steps {
     sh 'docker run -tdi -p 5000:5000 myapp:latest'
    }
} }
}