FROM golang
COPY main /opt/golang-server/main
COPY static /opt/golang-server/static
WORKDIR /opt/golang-server/
ENTRYPOINT ["/opt/golang-server/main"]


