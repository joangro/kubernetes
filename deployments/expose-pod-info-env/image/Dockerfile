FROM python:alpine 

ENV PYTHONUNBUFFERED=1

ADD . /app

WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python", "main.py"]
