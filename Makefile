.PHONY: init build tidy

init:
	go get -u github.com/dubbogo/tools/cmd/protoc-gen-triple

build:
	cd api && protoc -I . helloworld.proto --triple_out=plugins=triple:.
	CGO_CFLAGS=-Wno-undef-prefix go build -o serverbin ./server

tidy:
	go mod tidy
	rm serverbin