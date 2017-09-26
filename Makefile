IMAGE=quay.io/derailed/got
TAG=0.0.5

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

pg-up:    ## Provisions Postgres DB
	@helm install --name got -f deploys/helm/pg.yml stable/postgresql

pg-down:  ## Uninstall Postgres DB
	@helm delete got --purge

img:      ## Builds GoT image
	@docker build -f got-svc/Dockerfile -t ${IMAGE}:${TAG} --build-arg APP=got --build-arg VERSION=0.0.1 got-svc/

push: img ## Push GoT image to Quay registry
	@docker push $(IMAGE):$(TAG)
