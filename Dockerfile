# Supply an approved digest-pinned Java 21 runtime reference.
ARG JAVA_BASE
FROM ${JAVA_BASE}
ARG SOURCE_REVISION
LABEL org.opencontainers.image.source="https://github.com/DigitalWallonia/ITB-SHACL-Validator"       org.opencontainers.image.revision="${SOURCE_REVISION}"
WORKDIR /opt/validator
COPY validator.jar ./validator.jar
COPY resources/ ./resources/
RUN echo "1c356d4cb79a7d30f1e71788f8cb7c2738f796a779d8a83e009040b21e848c4c  validator.jar" | sha256sum -c -
ENV HOME=/tmp
USER 10001:10001
EXPOSE 8080
ENTRYPOINT ["java","-XX:MaxRAMPercentage=65.0","-Djava.io.tmpdir=/tmp","-Duser.home=/tmp","-Dvalidator.resourceRoot=/opt/validator/resources","-jar","/opt/validator/validator.jar"]
CMD ["--server.address=0.0.0.0","--server.port=8080"]
