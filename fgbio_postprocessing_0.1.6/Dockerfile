################## BASE IMAGE ######################

FROM python:3.6-slim

################## ARGUMENTS/Environments ##########

ARG BUILD_DATE
ARG BUILD_VERSION
ARG LICENSE="Apache-2.0"
ARG FGBIO_POSTPROCESSING_VERSION=0.1.6
ARG VCS_REF
################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Ian Johnson (johnsoni@mskcc.org)"

LABEL org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.version=${BUILD_VERSION} \
    org.opencontainers.image.licenses=${LICENSE} \
    org.opencontainers.image.version.fgbio_postprocessing=${FGBIO_POSTPROCESSING_VERSION} \
    org.opencontainers.image.source.fgbio_postprocessing="https://pypi.org/project/fgbio-postprocessing/" \
    org.opencontainers.image.vcs-url="https://github.com/msk-access/fgbio_postprocessing" \
    org.opencontainers.image.vcs-ref=${VCS_REF}

LABEL org.opencontainers.image.description="This container uses python3.6 as the base image to build \
    fgbio_postprocessing version ${FGBIO_POSTPROCESSING_VERSION}"

################## INSTALL ##########################

RUN apt-get update \
  && apt-get install gcc g++ zlib1g-dev -y \
  && pip install fgbio_postprocessing==0.1.6