## Ansible playbook for mosquitto and home assistant (hass)

This is an ansible playbook that installs mosquitto (MQTT broker) and 
hass. 

## Notes

As you can see from the docker-compose file, we are mounting a few
volumes for each of the services. The purpose of that is to be able
to control the service configuration. In mosquitto, you want to also 
control your login and password.





### References

  1. https://github.com/josefmtd/mosquitto-docker
  2. https://blog.feabhas.com/2020/02/running-the-eclipse-mosquitto-mqtt-broker-in-a-docker-container/#Run_the_docker_image
  3. 
