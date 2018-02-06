# MItamae
# https://github.com/itamae-kitchen/mitamae
base_url := https://github.com/itamae-kitchen/mitamae/releases/download/
version := v1.5.2
mitamae := mitamae_$(version)

uname := $(shell uname)
ifeq ($(uname),Darwin)
	bin = mitamae-x86_64-darwin
else ifeq ($(uname),Linux)
	bin = mitamae-x86_64-linux
endif


$(mitamae):
	curl -fL $(base_url)$(version)/$(bin).tar.gz | tar xz
	mv $(bin) $(mitamae)
	ln -f -s $(mitamae) mitamae

clean:
	rm -f mitamae*

