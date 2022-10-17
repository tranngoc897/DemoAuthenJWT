pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                sh 'git clone https://github.com/tranngoc897/DemoAuthenJWT.git'
                 sh 'git checkout develop'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install -f DemoAuthenJWT/pom.xml'
            }
        }
    }
}

node('dind-node') {
    stage('Checkout') { # (1)
      git url: 'https://github.com/piomin/sample-spring-microservices-new.git', credentialsId: 'piomin-github', branch: 'master'
    }
    stage('Build') { # (2)
      dir('config-service') {
        sh 'mvn clean install'
        def pom = readMavenPom file:'pom.xml'
        print pom.version
        env.version = pom.version
        currentBuild.description = "Release: ${env.version}"
      }
    }
    stage('Image') {
      dir ('config-service') {
        docker.withRegistry('https://192.168.99.100:5000') {
          def app = docker.build "piomin/config-service:${env.version}" # (3)
          app.push() # (4)
        }
      }
    }
}


node {

    withMaven(maven:'maven') {

        stage('Checkout') {
            git url: 'https://github.com/piomin/sample-spring-microservices.git', credentialsId: 'github-piomin', branch: 'master'
        }

        stage('Build') {
            sh 'mvn clean install'

            def pom = readMavenPom file:'pom.xml'
            print pom.version
            env.version = pom.version
        }

        stage('Image') {
            dir ('discovery-service') {
                def app = docker.build "localhost:5000/discovery-service:${env.version}"
                app.push()
            }
        }

        stage ('Run') {
            docker.image("localhost:5000/discovery-service:${env.version}").run('-p 8761:8761 -h discovery --name discovery')
        }

        stage ('Final') {
            build job: 'account-service-pipeline', wait: false
        }

    }

}