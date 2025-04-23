FROM ubuntu:22.04

# Set architecture to x86_64
RUN dpkg --add-architecture amd64

# Install required dependencies for Yocto
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    python3 \
    python3-pip \
    python3-pexpect \
    python3-git \
    python3-jinja2 \
    python3-subunit \
    locales \
    sudo \
    wget \
    cpio \
    unzip \
    chrpath \
    diffstat \
    gawk \
    texinfo \
    libtool \
    libncurses5-dev \
    libncursesw5-dev \
    zlib1g-dev \
    libssl-dev \
    bc \
    bison \
    flex \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure locales
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Create a non-root user for development
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch to non-root user
USER $USERNAME
WORKDIR /home/$USERNAME

# Install repo tool for managing Yocto repositories
RUN mkdir -p ~/bin && \
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && \
    chmod a+x ~/bin/repo

ENV PATH="/home/$USERNAME/bin:${PATH}"

# Final configuration
CMD [ "bash" ]