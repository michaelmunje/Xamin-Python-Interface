ARG BASE_CONTAINER=luke035/nvidia-anaconda-docker
FROM $BASE_CONTAINER

LABEL maintainer="Michael Munje & Danster"

ARG TF

RUN apt-get update && \
    apt-get upgrade -y && \
    conda update -n base conda && \
    pip install --upgrade pip && \
    conda install --quiet --yes \
    'pandas' && \
    conda install openjdk && \
    conda clean -tipsy
