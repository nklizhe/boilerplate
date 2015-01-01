#!/bin/bash -e
# install go
brew update
brew install hg go gpm gvp

gvp init
source gvp in

# install go tools
go get golang.org/x/tools/cmd/vet
go get code.google.com/p/go.tools/oracle
go get golang.org/x/tools/cmd/cover
go get code.google.com/p/go.tools/cmd/goimports
go get github.com/robertkrimen/godocdown

# install packages
gpm install

# cross-compiling toolchain
go get github.com/mitchellh/gox
gox -build-toolchain -os="darwin,linux,windows"

# restore original gopath
source gvp out


