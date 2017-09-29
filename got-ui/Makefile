IMG_NAME := quay.io/derailed/got-ui
IMG_TAG  := 0.0.3

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

img:      ## Build docker image
	@echo "Generating assets... Please wait!"
	@rm -rf dist
	@ng b -prod
	@echo "Building image $(IMG_NAME)"
	@docker build -f Dockerfile --rm -t $(IMG_NAME):master .
	@docker tag $(IMG_NAME):master $(IMG_NAME):$(IMG_TAG)

push: img ## Publish docker image
	@echo "Publishing release $(IMG_NAME)"
	docker push $(IMG_NAME)
