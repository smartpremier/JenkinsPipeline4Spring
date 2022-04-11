pipeline {
    tools {
        maven 'Maven 3.8.5'
        git 'Default'
    }
    stages {
        stage('Clone codebase') {
            git branch: 'main', credentialsId: 'f6d3ec62-0097-4a49-becc-bfa340111490', url: 'https://github.com/smartpremier/JenkinsPipeline4Spring.git'
            mvnHome = tool 'M2_HOME'
        }
    }
}