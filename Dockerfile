#Image base
FROM spacemacs/emacs25:develop

# Has to be secified before `RUN install-deps`
ENV UNAME="scientific-spacemacs"
ENV UID="1000"
MAINTAINER gmarxcc
LABEL version="1.0"
LABEL description="Spacemacs editor and a full suite for scientific data analysis."


# Ubuntu bionic and firefox
RUN apt-get update \
    && apt-get install \
    dstat \
    firefox \
    && rm -rf /var/lib/apt/lists/*
# Installation of python3 and spyder3
RUN apt-get update \
    && apt-get install \
    python3 -yq
RUN apt-get install \
    spyder3 -yq
# Installation of R
RUN apt-get install \
    r-base -yq 
RUN apt-get install \
    r-base-dev -yq
#R-Studio
RUN apt-get install \
    gdebi-core -yq
RUN wget \      https://download1.rstudio.org/rstudio-1.0.44-amd64.deb
RUN gdebi rstudio-1.0.44-amd64.deb \
    && rm rstudio-1.0.44-amd64.deb
    
# Copying .spacemacs file
COPY .spacemacs "${UHOME}/.spacemacs"
COPY private "${UHOME}/.emacs.d/private"

# Install layers dependencies and initialize the user
RUN install-deps
