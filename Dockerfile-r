#Image base
FROM spacemacs/emacs25:develop

# Has to be secified before `RUN install-deps`
ENV UNAME="spacemacs-r"
ENV UID="1000"
MAINTAINER gmarxcc
LABEL version="0.001"
LABEL description="Spacemacs editor and r."

#----------------------
# 1 Ubuntu bionic and firefox:
RUN apt-get update \
    && apt-get install \
    dstat \
    firefox \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update
# end of 1
#---------------------    
# 2 Installation of R:
RUN apt-get install \
    r-base -yq 
RUN apt-get install \
    r-base-dev -yq
# end of 3    
#------------------------ 
# 3 Spacemacs Configuration and layer installation:
# Copying .spacemacs file
COPY .spacemacs "${UHOME}/.spacemacs"
COPY private "${UHOME}/.emacs.d/private"
# Install layers dependencies and initialize the user
RUN install-deps
# end of 3
#-------------------------
