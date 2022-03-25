## Makefile for NodeJs application

APP_NAME = "NODEJS DEMO APP"


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
	rsync -avz -e "ssh -o StrictHostKeyChecking=no" --progress *   www@15.206.94.236:/home/www/nodeApp;
	cd /home/www/nodeApp;
	pm2 start server.js

##	ssh -o StrictHostKeyChecking=no -l www 15.206.94.236 "pwd; ls; whoami" ;

zipit:
	name="backup-"`date +%s`; 
	tar cvfz "${name}.tgz"  --exclude "node_modules" * ;


.PHONY: tests server install clean update deploy