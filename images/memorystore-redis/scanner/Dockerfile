from python:3.7

ENV PYTHONUNBUFFERED=0

ADD . /app

WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python3", "main.py"]
