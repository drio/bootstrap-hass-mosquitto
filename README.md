## Ansible playbook for mosquitto and home assistant (hass)

This is an ansible playbook that installs mosquitto (MQTT broker) and
hass.

I created this repo to make sure I can restore my home hass/mqtt setup
quickly. All my IOT devices use MQTT and I control them via HASS. Those
to services are crucial to my home network.

I started using those services and configuring them manually in a server. The
system was too fragile. I thought it'd be painful to rebuild the stack if
something happened to my server.

The harddrive on my server started to fail. So I decide to build this playbook.

## Notes

As you can see from the docker-compose file, we are mounting a few
volumes for each of the services. The purpose of that is to be able
to control the service configuration. 

In my mosquitto config, I also setup a login/passwd for authentication.

For hass, I already had a working instance so I created a backup (you can do so
via the hass UI) and restore it in the docker-compose service directory. Then
when the hass container starts, it will use that config. If you start fresh,
leave it empty. But remember to backup your config regularly.

### References

  1. https://github.com/josefmtd/mosquitto-docker
  2. https://blog.feabhas.com/2020/02/running-the-eclipse-mosquitto-mqtt-broker-in-a-docker-container/#Run_the_docker_image
