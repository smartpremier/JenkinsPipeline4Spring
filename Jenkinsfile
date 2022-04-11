node {
    def mvnHome
    stage('Preparation') {
        git branch: 'main', credentialsId: 'f6d3ec62-0097-4a49-becc-bfa340111490', url: 'https://github.com/smartpremier/JenkinsPipeline4Spring.git'
        echo 'JAVA_VERSION=$M2_HOME'
        echo 'M2_HOME=$M2_HOME'
        mvnHome = tool 'M2_HOME'
    }
}