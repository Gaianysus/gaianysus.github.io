.PHONY: all help build run builddocker rundocker kill rm-image rm clean enter logs

user = $(shell whoami)
ifeq ($(user),root)
$(error  "do not run as root!")
endif

all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""  This is merely a base image for usage read the README file
	@echo ""   1. make serve       - serve jekyll blog
	@echo ""   2. make drafts       - serve jekyll blog with drafts

serve: port
	jekyll serve -P`cat port`

drafts: port
	jekyll serve --drafts -P`cat port`

port:
	echo 4002 > port
