SHELL := bash
TAG    = $(shell git describe --abbrev=1|sed -e 's/-[a-z0-9]*$$//g')

.PHONY: build clean distclean

build: Dockerfile
	@[ x$(shell docker image ls $(REPOSITORY):$(TAG) --format='{{.ID}}') != x ] \
	|| (minid build -t $(REPOSITORY):$(TAG) . ; docker tag $(REPOSITORY):$(TAG) $(REPOSITORY):latest)

clean:
	rm -f *~ .*~

distclean: clean
