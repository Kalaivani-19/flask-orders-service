FROM python:3.12.5-bullseye

COPY . /orders-service
WORKDIR /orders-service

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]
