pipeline {
  agent any
  stages {
    stage('Build Libraries') {
      parallel {
        stage('Build Example 1') {
          steps {
            runMATLABCommand 'run(\'Example1\\dllModel_build\')'
          }
        }

        stage('Build Example 2') {
          steps {
            runMATLABCommand 'run(\'Example2\\discrete_tf_build\')'
          }
        }

        stage('Build Example 3') {
          steps {
            runMATLABCommand 'run(\'Example3\\bouncing_ball_build\')'
          }
        }

      }
    }

  }
}