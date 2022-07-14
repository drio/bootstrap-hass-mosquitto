HOST?=gopher.local
USER?=drio
INVENTORY?="--inventory-file=./inventory.ini"
MQTT_USER?=
MQTT_PASS?=

play:
	ansible-playbook ${INVENTORY} main.yml

requirements:
	ansible-galaxy collection install -r requirements.yml

full-rebuild: tag/dockerstop tag/dockerprune play

tag/%:
	ansible-playbook ${INVENTORY} main.yml --tags "$*"

ssh:
	ssh ${USER}@${HOST}

pub:
	mosquitto_pub -u $(MQTT_USER) -P $(MQTT_PASS) \
		-t 'topic/foo' -m 'msg_here' -h $(HOST)

sub:
	mosquitto_sub -u $(MQTT_USER) -P $(MQTT_PASS) \
		-t '#' -v  -h $(HOST) -F "%I %t %p"
