FROM alpine:3.24

# 1. Install System Dependencies
RUN apk add --no-cache \
  bash \
  git \
  neovim \
  sudo \
  build-base \
  curl \
  ripgrep \
  lazygit \
  tmux \
  python3 \
  lua5.1 \
  fd

# 2. Add the dev user
RUN adduser -D -s /bin/bash dev \
  && echo 'dev:dev' | chpasswd \
  && echo 'dev ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/dev \
  && chmod 0440 /etc/sudoers.d/dev

USER dev

# 3. Install AstroVim Template
# AstroNvim v4 uses a template repository that you use as your own config
RUN git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim \
  && rm -rf ~/.config/nvim/.git

# Set the working directory to a generic workspace folder
WORKDIR /home/dev/workspace

# Launch bash
CMD ["/bin/bash"]
