node {
    def mvnHome
    stage('Preparation') {
        git 'https://github.com/smartpremier/JenkinsPipeline4Spring.git'
        mvnHome = tool 'M2_HOME'
    }
    stage('Build') {
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
            } else {
                bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
            }
        }
    }
}