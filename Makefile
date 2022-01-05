SHELL     := bash

.PHONY: build clean distclean

all: check build

build:
	$(MAKE) -C doc $@

setup_check:
	$(MAKE) -C config MAKETARGET=build

check: setup_check
	lefthook --no-colors run pre-commit

clean distclean:
	-rm -f *~ .*~
	-for dir in config doc; do $(MAKE) -C $$dir $@; done
