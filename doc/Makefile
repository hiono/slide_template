SHELL := bash
MD     = $(wildcard *.md)
HTML   = $(MD:%.md=%.html)
PDF    = $(MD:%.md=%.pdf)
PPTX   = $(MD:%.md=%.pptx)

.PHONY: build clean distclean

build: $(HTML) $(PDF) $(PPTX)

$(HTML): $(MD)
	docker run -e MARP_USER="$(shell id -u):$(shell id -g)" -v $$PWD:/home/marp/app/ -e LANG="ja_JP.UTF-8" marpteam/marp-cli --allow-local-files --html $<

$(PDF): $(MD)
	docker run -e MARP_USER="$(shell id -u):$(shell id -g)" -v $$PWD:/home/marp/app/ -e LANG="ja_JP.UTF-8" marpteam/marp-cli --allow-local-files --html --pdf $<

$(PPTX): $(MD)
	docker run -e MARP_USER="$(shell id -u):$(shell id -g)" -v $$PWD:/home/marp/app/ -e LANG="ja_JP.UTF-8" marpteam/marp-cli --allow-local-files --html --pptx $<

clean:
	rm -f *~ .*~

distclean: clean
	rm -f $(HTML) $(PDF) $(PPTX)
