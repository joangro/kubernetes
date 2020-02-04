FROM golang:1.12-buster

ARG SERVICE_ID

ENV SERVICE_ID=$SERVICE_ID

RUN mkdir /app

ADD main.go go.mod /app/

WORKDIR /app

EXPOSE 8080

RUN go build -o main .

CMD ["/app/main"]
