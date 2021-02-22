.PHONY: build docker-build docker-push docker-run

build:
	./gradlew build

docker-build: build
	./gradlew bootBuildImage --imageName=vcosqui/login-form:0.0.1

docker-push: docker-build
	docker push vcosqui/login-form:0.0.1

docker-run: docker-build
	docker run -p 8080:8080 docker.io/vcosqui/login-form:0.0.1