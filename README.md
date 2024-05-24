<!-- ### Build:
docker build -t steam-video-streamer .

### Run:
docker run -d --restart on-failure -e STREAM_KEY=your_steam_stream_key -e STREAM_URL=rtmp://<server>/<app> -v /path/to/your/video.mp4:/usr/src/app/video.mp4 steam-video-streamer
 -->

## Steam Video Streamer

### Configure
Copy the `.env.example` file to `.env` and set the `STREAM_KEY`, `STREAM_URL` and `WEBHOOK_URL` variables.

### Run
```bash
docker compose build && docker compose up -d
```
