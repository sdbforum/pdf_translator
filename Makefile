NAME=pdf-translator
TAG=0.1.0
PROJECT_DIRECTORY=$(shell pwd)
MODEL_FILE=models/unilm/publaynet_dit-b_cascade.pth

build:
	mkdir -p models/unilm 
	
	docker build -t ${NAME}:${TAG} .

get_models:
	

run:
	docker run -it \
		--runtime=nvidia \
		--name pdf-translator \
		-v ${PROJECT_DIRECTORY}:/app \
		--gpus all \
		-p 8765:8765 \
		${NAME}:${TAG}

run-bash:
	docker run -it \
		--runtime=nvidia \
		--name pdf-translator \
		-v ${PROJECT_DIRECTORY}:/app \
		--gpus all \
		-p 8765:8765 \
		${NAME}:${TAG} /bin/bash
