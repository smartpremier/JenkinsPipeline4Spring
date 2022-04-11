## 빌드 전용 image 설정
# openjdk11 기반 이미지 사용
FROM openjdk:11-slim as build

LABEL maintainer="lmj <lmj@trycatch.kr>"

# pom.xml의 dockerfile-maven-plugin의 buildArgs를 통해 JAR_FILE 변수값 전달
#ARG JAR_FILE
ARG JAR_FILE=target/JenkinsPipeline4Spring-*.jar

# buildArgs를 통해 전달받은 JAR_FILE명을 app.jar라는 이름으로 복사
COPY ${JAR_FILE} app.jar

# 폴더 생성 후 app.jar 파일을 해당 폴더 하위에 압축 해제
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf /app.jar)

## APP 실행 전용 imaget 설정
# openjdk11 기반 이미지 사용
FROM openjdk:11-slim

# /tmp 볼륨 추가
VOLUME /tmp
# DEPENDENCY라는 변수에 /target/dependency 설정
ARG DEPENDENCY=/target/dependency
# 위의 빌드 전용으로 생성된 이미지로부터 필요한 파일 복사
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java", "-cp", "app:app/lib/*", "kr.trycatch.jenkinspipeline4spring.JenkinsPipeline4SpringApplication"]