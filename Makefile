ENV_FOLDER:='env'
SHELL:=/bin/bash

venv:
	rm -r $(ENV_FOLDER) | true
	python3 -m venv $(ENV_FOLDER) && source $(ENV_FOLDER)/bin/activate && make build 
	
docker-build:
	docker build -t minimal-flask .
	
build:
	pip install -r requirements.txt
	
run:
	flask run
	
debug:
	FLASK_ENV=development flask run
