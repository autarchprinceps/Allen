pipeline {
  agent any
  stages {
    stage('A') {
      steps {
        parallel(
          "A": {
            echo 'A'
            
          },
          "B": {
            echo 'B'
            
          },
          "C": {
            echo 'C'
            
          },
          "D": {
            echo 'D'
            
          }
        )
      }
    }
    stage('E') {
      steps {
        echo 'E'
      }
    }
  }
}