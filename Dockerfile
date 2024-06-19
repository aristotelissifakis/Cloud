Dockerfile
:authors: Aristotelis, Christos, Nikos
:revdate: 2024-06-19

[source, dockerfile]
----
FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y vlc && apt-get clean
CMD ["vlc", "--fullscreen"]
