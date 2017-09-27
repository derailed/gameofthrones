SVC-IMAGE=quay.io/derailed/got-svc
SVC-TAG=0.0.5

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

# -----------------------------------------------------------------------------
##GoT DB Commands
db-up:            ## Provisions Postgres DB
	@helm install --name got -f deploys/helm/pg.yml stable/postgresql

db-down:          ## Uninstall Postgres DB
	@helm delete got --purge

# -----------------------------------------------------------------------------
##GoT Svc Commands

svc-up:           ## Provision the GoT service
	@helm install --name got-svc -f deploys/helm/got-svc.yml imhotep/got-svc

svc-update:       ## Update Svc chart with new values
	@helm upgrade got-svc imhotep/got-svc -f deploys/helm/got-svc.yml

svc-down:         ## Uninstall GoT service
	@helm delete got-svc --purge

# -----------------------------------------------------------------------------
##GoT UI Commands

ui-up:            ## Provision the GoT UI
	@helm install --name got-ui -f deploys/helm/got-ui.yml imhotep/got-ui

ui-update:        ## Update UI chart with new values
	@helm upgrade got-ui imhotep/got-ui -f deploys/helm/got-ui.yml

ui-down:          ## Uninstall GoT UI
	@helm delete got-ui --purge


# -----------------------------------------------------------------------------
##Docker Builds...

svc-img:          ## Builds GoT Svc image
	@docker build -f got-svc/Dockerfile -t ${SVC_IMAGE}:${SVC_TAG} --build-arg APP=got --build-arg VERSION=0.0.1 got-svc/

svc-push: svc-img ## Push GoT Svc image to Quay registry
	@docker push $(SVC_IMAGE):$(SVC_TAG)
