.PHONY: build_image export_svg export_png export_images

DOCKER_IMAGE="neolabstech-plantuml-generator:latest"
LOCAL_PATH=pwd

DOCKER_RUN_COMMAND_PREFIX=docker run --rm -v $(shell pwd):/plantuml $(DOCKER_IMAGE)
EXPORT_COMMAND_PREFIX=$(DOCKER_RUN_COMMAND_PREFIX) java -Djava.awt.headless=true -jar /plantuml-files/plantuml.jar -o ../output
EXPORT_SVG=$(EXPORT_COMMAND_PREFIX) -tsvg diagrams/*.puml
EXPORT_PNG=$(EXPORT_COMMAND_PREFIX) -tpng diagrams/*.puml

build_image: ##build Build Docker image for neo-plantuml
	@docker build -t $(DOCKER_IMAGE) .

export_png: build_image
	$(EXPORT_PNG)

export_svg: build_image
	$(EXPORT_SVG)

export_images: build_image export_png export_svg
