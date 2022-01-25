SHELL := bash
TAG    = $(shell git describe --abbrev=1|sed -e 's/-[a-z0-9]*$$//g')

.PHONY: build clean distclean

build: .build

.build: Dockerfile myengine.js mystyle.scss
	(minid build -t $(REPOSITORY):$(TAG) . ; docker tag $(REPOSITORY):$(TAG) $(REPOSITORY):latest; touch .build)

clean:
	@rm -f *~ .*~

distclean: clean
	@docker image ls --format '{{.Repository}}:{{.Tag}}' | grep $(REPOSITORY) | xargs -r docker image rm -f
	@rm -f .build
