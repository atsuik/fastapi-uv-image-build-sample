FROM python:3.10.17-slim-bookworm AS base

ENV DEBIAN_FRONTEND=noninteractive


FROM base AS builder
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY pyproject.toml .
COPY uv.lock .

ENV UV_COMPILE_BYTECODE=1 \
    UV_NO_INSTALLER_METADATA=1 \
    UV_LINK_MODE=copy

RUN uv sync --frozen

FROM base AS app
WORKDIR /app

COPY --from=builder /app/.venv /app/.venv
COPY main.py .

ENV PATH=/app/.venv/bin:$PATH

EXPOSE 8000

CMD ["fastapi", "run", "main.py",  "--port", "8000"]