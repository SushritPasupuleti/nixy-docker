FROM ubuntu:25.04
# FROM nvidia/cuda:12.8.0-runtime-ubuntu24.04 # <-- Works with any Ubuntu base image

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    gnupg \
    xz-utils \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Create /nix directory and install Nix multi-user
RUN mkdir -m 0755 /nix && \
    adduser --disabled-password --gecos "" nixuser && \
    chown nixuser /nix

USER nixuser
ENV USER nixuser
ENV NIX_PATH /nix/var/nix/profiles/per-user/nixuser/channels
ENV PATH /home/nixuser/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH

RUN curl -L https://nixos.org/nix/install | sh

# Create working directory
WORKDIR /workspace

# Copy shell.nix
COPY shell.nix .

RUN bash -c "source /home/nixuser/.nix-profile/etc/profile.d/nix.sh"

# Run cowsay via nix-shell
CMD ["nix-shell", "--run", "cowsay Hello from Ubuntu 25.04 with Nix!"]
