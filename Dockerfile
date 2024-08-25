FROM python:3.12.5-bullseye

COPY . /orders-service

RUN ["pip install -r requirements.txt"]

RUN ["flask", "run"]

EXPOSE 5000