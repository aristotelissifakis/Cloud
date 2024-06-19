# Base image
FROM ubuntu:latest

# Environment settings
ARG DEBIAN_FRONTEND=noninteractive

# Install VLC
RUN apt-get update && apt-get install -y vlc && apt-get clean

# Entry point for the service
CMD ["vlc", "--fullscreen"]
