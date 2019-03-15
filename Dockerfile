#Image base
FROM spacemacs/emacs25:develop

# Has to be secified before `RUN install-deps`
ENV UNAME="scientific-spacemacs"
ENV UID="1000"
MAINTAINER gmarxcc
LABEL version="1.0"
LABEL description="Spacemacs editor and a full suite for scientific data analysis."


# Ubuntu Xenial and firefox
RUN apt-get update \
    && apt-get install \
    dstat \
    firefox \
    && rm -rf /var/lib/apt/lists/*
# Installation of r and rstudio
RUN apt-get update \
    && apt-get install \
    python3 -yq
RUN apt-get install \
    spyder3 -yq
# Copying .spacemacs file
COPY .spacemacs "${UHOME}/.spacemacs"
COPY private "${UHOME}/.emacs.d/private"

# Install layers dependencies and initialize the user
RUN install-deps
