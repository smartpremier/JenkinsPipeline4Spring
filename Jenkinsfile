node {
	def dockerImagePrefix='tc'
	def dockerImageArtifactId='JenkinsPipeline4Spring'
	def dockerImageVersion='latest'

	// 빌드 준비 단계
	// 소스 Repo(일반적으로 Git)에서 빌드 대상 소스 코드를 복사
    stage('Preparation') { // for display purposes
        checkout scm
    }

    // Docker Build
    stage('Build Docker Image') {
        echo 'dockerImagePrefix=${dockerImagePrefix}'
        echo 'dockerImageArtifactId=${dockerImageArtifactId}'
        echo 'dockerImageVersion=${BUILD_NUMBER}'
    }
}