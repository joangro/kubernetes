FROM golang:1.12-buster

ENV SERVICE_ID="Hello world!"

RUN mkdir /app

ADD main.go go.mod /app/

WORKDIR /app

EXPOSE 8080

RUN go build -o main .

CMD ["/app/main"]
