# Compile Release Stage
FROM derailed/alpine-elixir:1.5.0
LABEL maintainer="Fernand Galiana"

ENV MIX_ENV=prod
ARG APP=got
ARG VERSION=0.0.1

RUN mix do local.hex --force, local.rebar --force

WORKDIR /app
COPY . .

RUN mix do deps.get, deps.compile ;\
  mix release --env=prod ;\
  mkdir release ;\
  cd release ;\
  tar -xzf /app/_build/prod/rel/$APP/releases/$VERSION/$APP.tar.gz

# Runtime Stage
FROM alpine:3.5

ENV MIX_ENV=prod \
  PORT=4000 \
  REPLACE_OS_VARS=true

ARG APP=got
ARG VERSION=0.0.1
WORKDIR /app/bin

COPY scripts/run.sh /app/bin
COPY --from=0 /app/release /app
RUN apk add --no-cache --update bash openssl ca-certificates

EXPOSE 4000

ENTRYPOINT ["/app/bin/run.sh"]