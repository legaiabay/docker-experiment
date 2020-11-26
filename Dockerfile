FROM golang:1.14-alpine as builder
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go build -o main .

FROM golang:1.14-alpine as stage

COPY --from=builder /app/main /

CMD /main