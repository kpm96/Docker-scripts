#!/bin/bash

sudo docker run -d \
	--name pihole \
	--hostname pihole \
	-p 53:53/tcp \
	-p 53:53/udp \
	-p 80:80/tcp \
	-p 443:443 \
	-v "$(pwd)/etc-pihole/:/etc/pihole/" \
	-v "$(pwd)/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
	-e TZ="Europe/Warsaw" \
	--dns=127.0.0.1 --dns=9.9.9.9 \
	--restart=unless-stopped \
	pihole/pihole:latest

sudo docker exec -it pihole pihole -a -p
