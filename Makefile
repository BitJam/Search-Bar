SHELL     := /bin/bash
PREFIX    :=
TO_DIR    := /usr/local
NAME      := search-bar
ICON_DIR  := $(PREFIX)$(TO_DIR)/share/icons/$(NAME)
BIN_DIR   := $(PREFIX)$(TO_DIR)/bin
LIB_DIR   := $(PREFIX)$(TO_DIR)/lib/$(NAME)/bin
CP        := cp --preserve=mode
BIN_FILES := $(shell find bin -type f -executable)

.PHONY: help test install deb

help:
	@echo "make help       show this help"
	@echo "make test       launch trial $(NAME)"
	@echo "make install    install scripts and icons"
	@echo "make deb        install to deb/ subdirectory"
	@echo "make clean      delete the deb/ subdirectory"

test:
	@env PATH=./bin:./lib:$(PATH) bin/search-bar --idir=icons

install:
	mkdir -p $(ICON_DIR)
	$(CP) icons/*.png $(ICON_DIR)/
	mkdir -p $(LIB_DIR)
	$(CP) lib/* $(LIB_DIR)/
	mkdir -p $(BIN_DIR)
	$(CP) $(BIN_FILES) $(BIN_DIR)/

deb:
	rm -rf deb
	mkdir -p deb
	make install PREFIX=deb

clean:
	rm -rf deb
