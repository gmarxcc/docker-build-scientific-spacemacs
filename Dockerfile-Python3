#Image base
FROM spacemacs/emacs25:develop

# Has to be secified before `RUN install-deps`
ENV UNAME="scientific-spacemacs-python3"
ENV UID="1000"
MAINTAINER gmarxcc
LABEL version="0.01"
LABEL description="Spacemacs editor with Python-3 and Spyder-3"

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
# 2 Installation of python3 and spyder3:
RUN apt-get install \
    python3 -yq
RUN apt-get install \
    spyder3 -yq
# end of 2    
#------------------------ 
# 3 Spacemacs Configuration and layer installation:
# Copying .spacemacs file
COPY .spacemacs "${UHOME}/.spacemacs"
COPY private "${UHOME}/.emacs.d/private"
# Install layers dependencies and initialize the user
RUN install-deps
# end of 3
#-------------------------
