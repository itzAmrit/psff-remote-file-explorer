# psff-remote-file-explorer

Standalone remote file explorer UI extracted from `tsff-ui`.

This repo serves the Finder-style frontend. The UI is static, but it expects the same host to expose a writable `__downloads__` backend.

## What this app needs

- `GET /__downloads__/...`
- `PUT /__downloads__/...`
- `DELETE /__downloads__/...`
- `MOVE /__downloads__/...`
- `COPY /__downloads__/...`
- `MKCOL /__downloads__/...`

The live TSFF setup used nginx `dav_methods` over a real server directory such as `/srv/downloads/`.

## Run the UI only

```bash
docker build -t psff-remote-file-explorer .
docker run --rm -p 8080:80 psff-remote-file-explorer
```

That is enough to host the frontend on its own IP, but uploads, rename, move, delete, and folder creation will only work after you also wire the `__downloads__` backend on the same host.

## Run with a real backend

Use [`backend-example.nginx.conf`](./backend-example.nginx.conf) as the base server config if you want one host to serve both:

- the static UI at `/`
- the backing files under `/__downloads__/`

Replace `/srv/downloads/` with your actual storage path.

## Quick docker-compose

```bash
docker compose -f docker-compose.example.yml up --build -d
```
