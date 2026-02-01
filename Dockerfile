# build
FROM golang:1.20-alpine AS builder

WORKDIR /app
COPY main.go .

# RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
#     go build -ldflags="-s -w" -o app main.go

RUN  go build -o build-go main.go
FROM scratch
COPY --from=builder /app/build-go /

CMD ["/build-go"]