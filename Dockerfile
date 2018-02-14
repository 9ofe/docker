FROM debian:stretch-slim

RUN apt-get update && apt-get install -y bzip2 wget less x11vnc xvfb libxcursor1 libnss3 libegl1-mesa libasound2 libglib2.0-0 python

WORKDIR /opt/sinusbot

ADD install.sh .
RUN chmod +x install.sh

# Download/Install SinusBot
RUN bash install.sh sinusbot

# Download/Install TeamSpeak Client
RUN bash install.sh teamspeak

# Download/Install youtube-dl
RUN bash install.sh youtube-dl

EXPOSE 8087

VOLUME ["/opt/sinusbot/data", "/opt/sinusbot/scripts"]

ENTRYPOINT ["/opt/sinusbot/sinusbot"]