## Steam Video Streamer

### Configure
Copy the `.env.example` file to `.env` and set the `STREAM_KEY`, `STREAM_URL` and `WEBHOOK_URL` variables.

You can get the `STREAM_KEY` and `STREAM_URL` from this url: `https://steamcommunity.com/broadcast/upload/`.

Insert the video you want to stream in this folder and rename it to `video.mp4`.

### Run

With docker:
```bash
docker build -t steam-video-streamer .
docker run --env-file .env -v ./video.mp4:/usr/src/app/video.mp4 --restart on-failure -d steam-video-streamer
```

With docker-compose:

```bash
docker compose build && docker compose up -d
```
