# Use an official Ubuntu as a parent image (Linux Mint is based on Ubuntu)
FROM ubuntu:20.04

# Set environment variable to not require user interaction (for TZ data config)
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Install necessary packages
RUN apt-get update && \
    apt-get install -y vlc xvfb dbus alsa-utils pulseaudio pulseaudio-utils wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -ms /bin/bash vlcuser

# Switch to the non-root user
USER vlcuser

# Set environment variable for XDG_RUNTIME_DIR
ENV XDG_RUNTIME_DIR=/tmp/runtime-vlcuser
RUN mkdir -p /tmp/runtime-vlcuser

# Copy the video file into the container
COPY video.mp4 /home/vlcuser/video.mp4

# Copy the entrypoint script into the container
COPY entrypoint.sh /home/vlcuser/entrypoint.sh

# Ensure the entrypoint script is executable
#RUN chmod +x /home/vlcuser/entrypoint.sh

# Set the entry point to the script
ENTRYPOINT ["/home/vlcuser/entrypoint.sh"]
