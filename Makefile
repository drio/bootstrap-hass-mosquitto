HOST?=gopher.local
USER?=drio
INVENTORY?="--inventory-file=./inventory.ini"

play:
	ansible-playbook ${INVENTORY} main.yml

requirements:
	ansible-galaxy collection install -r requirements.yml

tag/%:
	ansible-playbook ${INVENTORY} main.yml --tags "$*"

ssh:
	ssh ${USER}@${HOST}

