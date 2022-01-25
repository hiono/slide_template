SHELL  := bash
MD      = $(wildcard *.md)
HTML    = $(MD:%.md=%.html)
PDF     = $(MD:%.md=%.pdf)
PPTX    = $(MD:%.md=%.pptx)
RUN     = docker run -it --rm
MARP    = $(REPOSITORY):latest marp
MARPDIR = /home/marp/.cli
USER    = $(shell id -u):$(shell id -g)
MOUNT1  = $(CURDIR):/home/marp/app
THEME   = $(MARPDIR)/mystyle.css
ENGINE  = $(MARPDIR)/myengine.js
OPT     = --html --allow-local-files --bespoke.progress --theme $(THEME) --engine $(ENGINE)

.PHONY: build clean distclean

build: $(HTML) $(PDF) $(PPTX)

$(HTML): $(MD) # $(THEME)
	$(RUN) -e MARP_USER=$(USER) -v $(MOUNT1) $(MARP) $(OPT) -- $<

$(PDF): $(MD) # $(THEME)
	$(RUN) -e MARP_USER=$(USER) -v $(MOUNT1) $(MARP) $(OPT) --pdf -- $<

$(PPTX): $(MD) # $(THEME)
	$(RUN) -e MARP_USER=$(USER) -v $(MOUNT1) $(MARP) $(OPT) --pptx -- $<

clean:
	rm -f *~ .*~

distclean: clean
	rm -f $(HTML) $(PDF) $(PPTX) $(THEME) $(THEME).map
