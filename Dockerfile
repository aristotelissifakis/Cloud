Dockerfile
:authors: Aristotelis, Christos, Nikos
:revdate: 2024-06-19

# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variable to not require user interaction (for TZ data config)
ENV DEBIAN_FRONTEND=noninteractive

# Install VLC and necessary packages
RUN apt-get update && \
    apt-get install -y vlc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the video file into the container
COPY video.mp4 /home/georgios/Desktop/vlc-docker/

# Set VLC to open the video
CMD ["vlc", "--fullscreen", "/home/georgios/Desktop/vlc-docker/video.mp4"]
