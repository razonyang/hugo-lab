FROM golang:alpine as golang
ARG GOPROXY
# Go module proxy
ENV GOPROXY=${GOPROXY}
ARG HUGO_MODULE_PROXY
# Hugo module proxy
ENV HUGO_MODULE_PROXY=${HUGO_MODULE_PROXY}

RUN apk add --no-cache build-base

# Install Hugo
RUN go install -tags extended github.com/gohugoio/hugo@v0.111.2

COPY ./ /src
WORKDIR /src
RUN hugo
