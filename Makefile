ENV_FOLDER:='env'
SHELL:=/bin/bash
IMAGE_NAME:='minimal-flask'

venv:
	rm -r $(ENV_FOLDER) | true
	python3 -m venv $(ENV_FOLDER) && source $(ENV_FOLDER)/bin/activate && make build 
	
docker-build:
	docker build -t $(IMAGE_NAME) .
	
docker-run:
	docker run -p 5000:5000 $(IMAGE_NAME)

build:
	pip install -r requirements.txt
	
run:
	flask run --host=0.0.0.0
	
debug:
	FLASK_ENV=development flask run
