# Use the offical Golang image to create a build artifact.
# This is based on Debian and sets the GOPATH to /go.
# https://hub.docker.com/_/golang
FROM golang:1.12 as builder

# Copy local code to the container image.
COPY . .

# Build the command inside the container.
# (You may fetch or manage dependencies here,
# either manually or with a tool like "godep".)
RUN CGO_ENABLED=0 GOOS=linux go build -v -o main

# Use a Docker multi-stage build to create a lean production image.
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM alpine
RUN apk add --no-cache ca-certificates

# Copy the binaries and site content to the production image from the builder stage.
COPY --from=builder /go/main /main
COPY --from=builder /go/index.html /index.html
COPY --from=builder /go/*.png /
COPY --from=builder /go/*.jpg /
COPY --from=builder /go/favicon.ico /
COPY --from=builder /go/google67c5a6e5679a571d.html /
COPY --from=builder /go/sitemap.xml /

# Run the web service on container startup.
CMD ["/main"]
