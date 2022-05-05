## Makefile for NodeJs application

APP_NAME = "NODEJS DEMO APP"
SERVER_IP = 10.182.11.194
USER = www


all: install tests server


tests: ;@echo "Testing ${APP_NAME}....."; \
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
	export BUILD_ID=dontKillMePlease ;\
	pm2 start server.js	

clean : ;
	rm -rf node_modules

deploy: ;
	rsync -avz -e "ssh -v -o StrictHostKeyChecking=no" --progress *   ${USER}@${SERVER_IP}:/home/www/nodeApp ;
	rsync -avz -e "ssh -v -o StrictHostKeyChecking=no" --progress .??*   ${USER}@${SERVER_IP}:/home/www/nodeApp ;
	ssh -o StrictHostKeyChecking=no -l ${USER} ${SERVER_IP} "cd nodeApp; pm2 restart all" ;

zipit:
	tar cvfz "backup-"`date +%s`  --exclude "node_modules" * ;


.PHONY: tests server install clean update deploy