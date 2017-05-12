#!/usr/bin/env bash
if [ -n "${INFRASTRUCTURE}" ]; then INTERNAL_DOMAIN="${INFRASTRUCTURE}"; else INTERNAL_DOMAIN="internal"; fi
if [ -n "${OSS_DOCKER_REGISTRY}" ]; then export DOCKER_REGISTRY="${OSS_DOCKER_REGISTRY}"; else export DOCKER_REGISTRY="registry.docker.${INTERNAL_DOMAIN}"; fi
echo " OSS_DOCKER_REGISTRY:${OSS_DOCKER_REGISTRY}, INTERNAL_DOMAIN: ${INTERNAL_DOMAIN}"

export MAVEN_OPTS="${MAVEN_OPTS} -Dinternal-mvnsite.prefix=dav:http://nexus.${INTERNAL_DOMAIN}/nexus/repository/mvnsite/"
export MAVEN_OPTS="${MAVEN_OPTS} -Dinternal-nexus.mirror=http://nexus.${INTERNAL_DOMAIN}/nexus/repository/maven-public/"
export MAVEN_OPTS="${MAVEN_OPTS} -Dinternal-nexus.repositories=http://nexus.${INTERNAL_DOMAIN}/nexus/repository"
export MAVEN_OPTS="${MAVEN_OPTS} -Dinternal-sonar.host.url=http://sonarqube.${INTERNAL_DOMAIN}"
export MAVEN_OPTS="${MAVEN_OPTS} -Dcheckstyle.config.location=${BUILD_SCRIPT_LOC}/src/main/checkstyle/google_checks_6.19.xml"
export MAVEN_OPTS="${MAVEN_OPTS} -Dpmd.ruleset.location=${BUILD_SCRIPT_LOC}/src/main/pmd/pmd-ruleset-5.3.5.xml"

export MAVEN_OPTS="${MAVEN_OPTS} -Dinfrastructure=${INFRASTRUCTURE}"
export MAVEN_OPTS="${MAVEN_OPTS} -Ddocker.registry=${DOCKER_REGISTRY}"
export MAVEN_OPTS="${MAVEN_OPTS} -Dsite=${BUILD_SITE}"
export MAVEN_OPTS="${MAVEN_OPTS} -Duser.language=zh -Duser.region=CN -Dfile.encoding=UTF-8 -Duser.timezone=Asia/Shanghai"
export MAVEN_OPTS="${MAVEN_OPTS} -Dmaven.test.failure.ignore=${BUILD_TEST_FAILURE_IGNORE}"
export MAVEN_OPTS="${MAVEN_OPTS} -Dfrontend.nodeDownloadRoot=https://npm.taobao.org/mirrors/node/"
export MAVEN_OPTS="${MAVEN_OPTS} -Dfrontend.npmDownloadRoot=http://registry.npm.taobao.org/npm/-/"
export MAVEN_OPTS="${MAVEN_OPTS} -Dfrontend.npmDownloadRoot=http://registry.npm.taobao.org/npm/-/"

echo "MAVEN_OPTS: ${MAVEN_OPTS}"

## some var for integration-test
export EUREKA_CLIENT_SERVICEURL_DEFAULTZONE=""
export SPRING_CLOUD_CONFIG_DISCOVERY_SERVICEID=""
export SPRING_RABBITMQ_HOST=""
export SPIRNG_RABBITMQ_PORT=""
export CONFIG_SERVER_HOST=""
export CONFIG_SERVER_PORT=""
