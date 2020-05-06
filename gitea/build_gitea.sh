#!/bin/sh
# Creating GITEA container
container=$(buildah from alpine)

buildah run $container apk add git
buildah run $container apk add bash

wget https://dl.gitea.io/gitea/1.9/gitea-1.9-linux-arm-6
dir=$(buildah mount $container)

buildah run $container addgroup -S git
buildah run $container adduser -S -s /bin/ash -g 'Git Version Control' -G git -h /home/git git

buildah run $container mkdir -p /var/lib/gitea/{custom,data,log}
buildah run $container chown -R git:git /var/lib/gitea/
buildah run $container chmod a+rx /var/lib/gitea/
buildah run $container mkdir /etc/gitea
buildah run $container chown root:git /etc/gitea
buildah run $container chmod 770 /etc/gitea

#buildah config --env GITEA_WORK_DIR=/var/lib/gitea/

mv gitea-1.9-linux-arm-6 $dir/usr/local/bin/gitea
chmod +x $dir/usr/local/bin/gitea

buildah config --cmd "/usr/local/bin/gitea web --config /etc/gitea/app.ini" $container
buildah config --port "3000:3000" $container

buildah commit $container gitea_arm
buildah rm $container
