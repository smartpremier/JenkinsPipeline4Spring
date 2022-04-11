node {
	def dockerImagePrefix='tc'
	def dockerImageArtifactId='JenkinsPipeline4Spring'
	def dockerImageVersion='latest'

    def mvnHome
	// 빌드 준비 단계
	// 소스 Repo(일반적으로 Git)에서 빌드 대상 소스 코드를 복사
    stage('Preparation') { // for display purposes
        git branch: 'main', url: 'https://github.com/smartpremier/JenkinsPipeline4Spring.git'
        // M3_HOME 은 Jenkins Global Tool Configuration(전역 도구 설정)에 설정된 이름으로 사용할것!
        mvnHome = tool 'M3_HOME'
    }

	// maven 빌드 & 테스트(윈도우 지원안함)
    stage('Build and Test') {
        // Run the maven build
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                sh "'$MVN_HOME/bin/mvn' -Dmaven.test.failure.ignore clean package"
            } else {
                echo "Not supported OS"
            }
        }
    }

	// 테스트 결과 리프트 저장
    stage('Test Results') {
        junit '**/target/surefire-reports/TEST-*.xml'
        archiveArtifacts 'target/*.jar'
    }

    // 정적 분석 수행
    stage('Static code Analytics') {
        echo 'If you want static code analytics , You can write some scripts to analysis your code statically'
    }

    // M2_Repo가 있는 경우 해당 Repository에 업로드


    // Docker 이미지 빌드 수행
	stage('Build docker image') {
	    sh "'${mvnHome}/bin/mvn' -Ddocker.image.prefix='${dockerImagePrefix}' -Dproject.artifactId='${dockerImageArtifactId}' -Ddocker.image.version='${dockerImageVersion}' dockerfile:build"
	}

	// 빌드된 Docker 이미지를 Docker Registry에 업로드

}