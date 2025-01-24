FROM mcr.microsoft.com/devcontainers/base:jammy

USER vscode

RUN sudo apt update -y && sudo apt install -y \
  # Ruby build
  autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev \
  # PostgreSQL
  libpq-dev
