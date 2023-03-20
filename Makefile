
build:
	docker build -t gvegayon/myrstudio .

run:
	docker run --rm -i -u $(shell id -u):$(shell id -g) \
		-p 8787:8787 gvegayon/myrstudio rstudio-server start
