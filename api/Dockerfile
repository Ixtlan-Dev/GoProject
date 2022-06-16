FROM golang:1.18

WORKDIR $GOPATH/src/gin_docker

ADD . ./

RUN go build main.go
EXPOSE 8080
#This is consistent with the compiled file name
CMD chmod +x ./main 
ENTRYPOINT  ["./main"]