#!/bin/bash

echo -n "Enter NAME (default = www):"
read ${NAME:-www}
echo  "$NAME"


echo -n "Enter PORT number (default = 80):"
read ${PORT:-80}
echo  "$PORT"


sudo docker run -d \
	--name nginx-$NAME \
	-p $PORT:80 \
	-v "$(pwd)/nginx-$NAME/:/usr/share/nginx/html" \
	--restart=unless-stopped \
	nginx:latest
