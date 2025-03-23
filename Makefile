MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

.PHONY: clean
clean:
ifneq (,$(wildcard ./public))
	rm -rf public
endif

ifneq (,$(wildcard ./resources))
	rm -rf resources
endif

.PHONY: build
build:
	hugo

.PHONY: serve
serve:
	hugostart

.PHONY: sync
sync:
	cp -r /home/bmorriso/local-repo/projects/hugoThings/simpl/themes/layouts/* layouts

.PHONY: tidy
tidy:
	hugo mod tidy
