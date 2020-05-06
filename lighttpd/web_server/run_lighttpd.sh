podman run --rm -d --name webserver -v ./website:/var/www/localhost -v ./conf:/etc/lighttpd -p 8888:80 lighttpd_arm
