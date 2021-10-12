.PHONY: serve
serve:
	docker run --rm -it -v ${PWD}:/src -p 1313:1313 klakegg/hugo server

.PHONY: build
build:
	docker run --rm -it -v ${PWD}:/src klakegg/hugo build