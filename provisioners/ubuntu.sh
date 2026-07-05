#!/bin/bash


# Install Go tools
go install github.com/go-delve/delve/cmd/dlv@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/stress@latest