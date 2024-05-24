# Use an official Alpine Linux image as the base image
FROM alpine:latest

# Install ffmpeg and necessary codecs
RUN apk update && \
    apk add --no-cache ffmpeg bash curl && \
    rm -rf /var/cache/apk/*

RUN mkdir -p /usr/src/app

# Create a directory for the script
WORKDIR /usr/src/app

# Copy the script into the container
COPY stream_loop.sh .

# Make the script executable
RUN chmod +x stream_loop.sh

# Set the default command to execute the script
CMD ["./stream_loop.sh"]
