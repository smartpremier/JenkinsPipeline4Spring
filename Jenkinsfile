node {

    def mvnHome
    tools {
        git 'Default'
    }

    // 빌드를 위한 소스코드 clone
    stage('Clone codebase') {
        git branch 'main', url: 'https://github.com/smartpremier/JenkinsPipeline4Spring.git'

        // M3_HOME은 사전에 JENKINS에 정의되어 있어야 함.
        mvnHome = tool 'M3_HOME'
    }

    // Maven 빌드 수행
    stage('Build') {
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
            } else {
                bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
            }
        }
    }

    stage('Results') {
        junit '**/target/surefire-reports/TEST-*.xml'
        archiveArtifacts 'target/*.jar'
    }
}