FROM ubuntu:latest
MAINTAINER Thanh Tran "thanhhb2206014@student.ctu.edu.vn"
RUN apt update -y && \

    apt install -y python3-pip python3-venv python3-dev build-essential && \

    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN python3 -m venv venv && \

    ./venv/bin/pip install --upgrade pip && \

    ./venv/bin/pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PATH="/app/venv/bin:$PATH"

EXPOSE 5000

CMD ["python", "flask_docker.py"] 
