#!/bin/bash

# Remove --rm from any of these docker commands to persist the container after you exit

docker run --name dev -it --rm -v ./workspace:/home/dev/workspace -v ./nvim-share:/home/dev/.local/share/nvim -v ./nvim-state:/home/dev/.local/state/nvim gloof11/dev-environment 

# Uncomment if you have your own nvim config
# docker run --name dev -it --rm -v ./workspace:/home/dev/workspace -v ./nvim-config:/home/dev/.config/nvim -v ./nvim-share:/home/dev/.local/share/nvim -v ./nvim-state:/home/dev/.local/state/nvim gloof11/dev-environment 
