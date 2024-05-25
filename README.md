# Steam Video Streamer Docker

A Docker image to stream a video in loop on Steam.

## Features
- Stream videos continuously on Steam.
- Easy setup with Docker and Docker Compose.
- Customizable via environment variables.

## Setup

### Prerequisites
- Docker installed on your machine.

### Configuration
1. Copy the `.env.example` file to `.env`:
   ```bash
   cp .env.example .env
   ```
2. Set the following variables in the `.env` file:
   - `STREAM_KEY`
   - `STREAM_URL`
   - `WEBHOOK_URL`

   You can obtain `STREAM_KEY` and `STREAM_URL` from [Steam's Broadcast settings](https://steamcommunity.com/broadcast/upload/).

3. Place the video you want to stream in the repository directory and rename it to `video.mp4`.

### Running the Streamer

#### Using Docker
1. Build the Docker image:
   ```bash
   docker build -t steam-video-streamer .
   ```
2. Run the Docker container:
   ```bash
   docker run --env-file .env -v $(pwd)/video.mp4:/usr/src/app/video.mp4 --restart on-failure -d steam-video-streamer
   ```

#### Using Docker Compose
1. Build and start the Docker Compose services:
   ```bash
   docker-compose build
   docker-compose up -d
   ```

## File Structure
- `.env.example`: Example environment file.
- `Dockerfile`: Docker configuration.
- `docker-compose.yml`: Docker Compose configuration.
- `stream_loop.sh`: Shell script to loop the video stream.
- `video.mp4`: Placeholder for your video file.

## Contributing
Feel free to submit issues or pull requests.

## License
This project is licensed under the MIT License.
