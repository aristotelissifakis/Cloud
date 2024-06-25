#!/bin/bash

# Function to clean up PulseAudio when the script exits
cleanup_pulseaudio() {
    echo "Cleaning up PulseAudio..."
    pactl exit
}

# Trap signals to ensure cleanup
trap cleanup_pulseaudio EXIT

# Start PulseAudio
pulseaudio -D --exit-idle-time=-1

# Set up PulseAudio environment variables
export PULSE_SERVER=unix:/tmp/pulse-native

# Create PulseAudio directory
mkdir -p /tmp/pulse-native

# Ensure proper permissions for PulseAudio
chmod -R 777 /tmp/pulse-native

# Run VLC with audio options
cvlc --no-video-title-show --no-xlib --fullscreen /home/vlcuser/video.mp4

