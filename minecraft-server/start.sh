podman run -d -it -e EULA=TRUE -p 25565:25565 -v /home/thepicpixel/Containers/minecraft-server/conf/:/data -e VERSION=1.15.2 --name mc itzg/minecraft-server:armv7
