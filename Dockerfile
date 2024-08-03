FROM golang:1.22.1

WORKDIR /app

COPY . .

RUN go mod tidy

COPY *.go ./

COPY tracker.db ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main main.go

CMD ["/main"]