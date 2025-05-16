FROM python:3.9-slim as builder

WORKDIR /app
COPY pyproject.toml .

RUN pip install --user --upgrade pip && \
    pip install --user . && \
    pip cache purge

FROM python:3.9-slim

WORKDIR /app

COPY --from=builder /root/.local /root/.local
COPY kubsu/ ./kubsu/
COPY app.py .

ENV PATH=/root/.local/bin:$PATH
ENV PYTHONPATH=/app

EXPOSE 8015

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8015"]
