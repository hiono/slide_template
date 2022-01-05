SHELL     := bash

SUBDIRS = config doc

.PHONY: build clean

all: build check

all-subdirs:
	-for dir in $(SUBDIRS); do $(MAKE) -C $$dir $(MAKETARGET); done

check:
	lefthook run pre-commit

build clean distclean:
	$(MAKE) MAKETARGET=$@ all-subdirs
