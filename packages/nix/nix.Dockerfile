FROM ubuntu:latest

# As root we install everything
RUN apt update && apt install tar wget curl xz-utils sudo -y
SHELL ["/bin/bash", "-c"]
RUN usermod -aG sudo ubuntu
RUN echo "ubuntu:ubuntu" > pass.txt
RUN chpasswd ubuntu < pass.txt

RUN mkdir -m 0755 /nix && chown ubuntu /nix

USER ubuntu

SHELL ["/bin/bash", "-c"]


# Single user installation without user interaction
RUN pushd $(mktemp -d) &&\
    export VERSION=2.19.2 &&\
    export SYSTEM=x86_64-linux &&\
    curl -LO https://releases.nixos.org/nix/nix-$VERSION/nix-$VERSION-$SYSTEM.tar.xz &&\
    tar xfJ nix-$VERSION-$SYSTEM.tar.xz &&\
    cp -r nix-$VERSION-$SYSTEM $HOME/nix &&\
    cd nix-$VERSION-$SYSTEM &&\
    ./install &&\
    popd

RUN echo "export PATH=~/.nix-profile/bin:$PATH" >> ~/.bashrc

ENTRYPOINT ["/bin/bash"]




