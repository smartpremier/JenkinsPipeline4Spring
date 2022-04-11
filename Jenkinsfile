node {
    def mvnHome
    stage('Preparation') {
        git branch: 'main', credentialsId: 'f6d3ec62-0097-4a49-becc-bfa340111490', url: 'https://github.com/smartpremier/JenkinsPipeline4Spring.git'
        echo '$M2_HOME'
        mvnHome = tool 'M2_HOME'
    }
}