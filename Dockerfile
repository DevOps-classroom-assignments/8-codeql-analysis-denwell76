FROM golang:1.21

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

RUN mkdir -p safe-files && echo "Hello World" > safe-files/hello.txt


RUN go build -o /server main.go

EXPOSE 8080

CMD ["/server"]