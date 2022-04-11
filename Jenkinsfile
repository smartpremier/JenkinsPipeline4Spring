node {
    def mvnHome = tool 'M3_HOME'
    stage('Build') {
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                echo "This is Unix"
            } else {
                echo "This is not Unix"
            }
        }
    }
}