export $PWD
export $USER

init:
	@bash ${PWD}/tools/init.sh

up: 
	@docker-compose -f ${PWD}/tools/docker/docker-compose.yml up -d

down:
	@docker-compose -f ${PWD}/tools/docker/docker-compose.yml down

tail:
	@tail -f ${PWD}/volumes/odoo-data/odoo-server.log

shell:
	@docker exec -it ${PROJECT_NAME}_odoo14 /usr/bin/odoo shell --db_host db --db_user odoo -d ${DB_NAME} -w odoo

scaffold:
	@docker exec -it ${PROJECT_NAME}_odoo14 /usr/bin/odoo scaffold ${name} /mnt/extra-addons
	@sudo chown -R ${USER}:${USER} ${PWD}/extra-addons
	
upgrade:
	@docker exec -it ${PROJECT_NAME}_odoo14 /usr/bin/odoo -u ${name} --db_host db --db_user odoo -d ${DB_NAME} -w odoo -p 8888
