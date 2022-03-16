## Makefile for NodeJs application

APP_NAME = "NODEJS DEMO APP"


all: install test server


test: ;@echo "Testing ${APP_NAME}....."; \
	export NODE_PATH=.; \
	./node_modules/mocha/bin/mocha;

server : ;@echo "Starting ${APP_NAME}....."; \
	export NODE_PATH=.; \
	node server.js

install: ;@echo "Installing ${APP_NAME}....."; \
	npm install

update: ;@echo "Updating ${APP_NAME}....."; \
	git pull --rebase; \
	npm install

pm2Start: ;@echo "PM2 Starting ${APP_NAME}....."; \
	export NODE_PATH=.; \
	pm2 start server.js	

clean : ;
	rm -rf node_modules


.PHONY: test server install clean update