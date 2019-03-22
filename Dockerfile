#Image base
FROM spacemacs/emacs25:develop

# Has to be secified before `RUN install-deps`
ENV UNAME="scientific-spacemacs"
ENV UID="1000"
MAINTAINER gmarxcc
LABEL version="0.1"
LABEL description="Spacemacs editor and a full suite for scientific data analysis."
#----------------------
# 1 Ubuntu bionic and firefox:
RUN apt-get update \
    && apt-get install \
    dstat \
    firefox \
    && rm -rf /var/lib/apt/lists/*
# end of 1
#---------------------    
# 2 Installation of vim:
RUN apt-get update \
    && apt-get install \
    vim 
# end of 2
#------------------------ 
# 3 texlive-latex-extra:
RUN apt-get update \
    && apt-get install \
    texlive-full
# end of 3
#-----------------------
# 4 Spacemacs Configuration and layer installation:
# Copying .spacemacs file
COPY .spacemacs "${UHOME}/.spacemacs"
COPY private "${UHOME}/.emacs.d/private"
# Install layers dependencies and initialize the user
RUN install-deps
# end of 4
#-------------------------