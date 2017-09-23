IMAGE=quay.io/derailed/got
TAG=0.0.2

img:
	@docker build -t ${IMAGE}:${TAG} --build-arg APP=got --build-arg VERSION=0.0.1 .

push:             ## Push docker image to registry
	@docker push $(IMAGE):$(TAG)

run:
	@docker run -p 4000:4000 ${IMAGE}:${TAG}
