FROM golang:1.15 as build
WORKDIR /go/src/desafio1
COPY . . 
RUN GOOS=linux go build -ldflags="-s -w"

FROM scratch
WORKDIR /go/src/desafio1
COPY --from=build /go/src/desafio1/desafio1 .

CMD ["./desafio1"]