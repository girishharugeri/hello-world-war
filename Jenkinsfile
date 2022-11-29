pipeline {
  agent { label 'slave_jenkins' }
  stages {
    stage ( 'my build' ) {
      steps {
          sh 'whoami'
          sh 'ls'
          sh 'pwd'
          sh 'df -h .'
          sh 'sudo mvn package'
          sh 'sudo cp -r target/hello-world-war-1.0.0.war /opt/apache-tomcat-10.0.27/webapps'
          sh 'sudo tomcatdown'
          sh 'sudo tomcatup'
      }   
    }
  }
}
