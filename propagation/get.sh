#!/bin/bash
export ENV_EXPORT=global
export ENV_EXPORT_2=global

export EXPORT_CATCH_DOCKER=${ENV_DOCKER}

export EXPORT_CATCH_INLINE=${ENV_INLINE}
export EXPORT_CATCH_INTERNAL_1=${ENV_INTERNAL_1}
export EXPORT_CATCH_INTERNAL_2=${ENV_INTERNAL_2}
export EXPORT_CATCH_ROOT=${ENV_ROOT}
export EXPORT_CATCH_RUN=${ENV_RUN}

export DOCKER_OVERRIDE_EXPORT=global
export EXPORT_OVERRIDE_INLINE=global
export EXPORT_OVERRIDE_INTERNAL_1=global
export EXPORT_OVERRIDE_INTERNAL_2=global
export EXPORT_OVERRIDE_ROOT=global

# export EXPORT_OVERRIDE_RUN=global
# --build-arg
docker-compose build envs_propagation
# `docker compose` doesn't see `-e ENV_EXPORT`
ENV_RUN=run docker-compose run --rm \
-e ENV_EXPORT \
-e ENV_RUN \
-e DOCKER_OVERRIDE_EXPORT \
-e EXPORT_OVERRIDE_INLINE \
-e EXPORT_OVERRIDE_INTERNAL_1 \
-e EXPORT_OVERRIDE_INTERNAL_2 \
-e EXPORT_OVERRIDE_ROOT \
envs_propagation > result.env

ENV_RUN=run \
ENV_EXPORT=global \
ENV_EXPORT_2=global \
DOCKER_OVERRIDE_EXPORT=global \
EXPORT_OVERRIDE_INLINE=global \
EXPORT_OVERRIDE_INTERNAL_1=global \
EXPORT_OVERRIDE_INTERNAL_2=global \
EXPORT_OVERRIDE_ROOT=global \
docker-compose config > result.yml
