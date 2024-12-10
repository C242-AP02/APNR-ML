FROM python:3.11-slim
RUN apt-get update && \
    apt-get install -y --no-install-recommends libopencv-dev curl python3-pip && \
    pip3 install gsutil && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN mkdir models
RUN gsutil -m cp -r gs://models-volume-apnr-megalogic/rayyaa models
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8080
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]