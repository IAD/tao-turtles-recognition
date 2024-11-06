FROM tiangolo/uvicorn-gunicorn:python3.10

RUN apt update && \
    apt install -y htop libgl1-mesa-glx libglib2.0-0

COPY requirements.txt /tmp/requirements.txt

RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY app.py app.py
COPY app.py app.py
COPY main.py main.py
COPY openapi.json openapi.json
COPY runs/detect/train/weights/best.pt runs/detect/train/weights/best.pt

CMD [ "uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8001"]
