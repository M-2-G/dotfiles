FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

# Install basic tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    sudo \
    vim \
    zsh \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create a standard non-root user
RUN useradd -m -s /bin/zsh core && \
    usermod -aG sudo core && \
    echo "core ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/99-nopasswd && \
    chmod 0440 /etc/sudoers.d/99-nopasswd

# Download the bootstrap script and make it executable 
RUN curl -fsSL https://raw.githubusercontent.com/M-2-G/dotfiles/main/bootstrap-ubuntu.sh -o /usr/local/bin/bootstrap-ubuntu.sh && \
    chmod +x /usr/local/bin/bootstrap-ubuntu.sh

USER core
WORKDIR /home/core

CMD ["/bin/zsh"]
