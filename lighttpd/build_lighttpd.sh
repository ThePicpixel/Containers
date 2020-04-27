container=$(buildah from alpine)

buildah run $container apk add lighttpd
buildah config --port "8888:80" $container

path=$(buildah mount $container)
rm $path/etc/lighttpd/lighttpd.conf
cp lighttpd.conf $path/etc/lighttpd/lighttpd.conf

buildah run $container chown -R lighttpd:lighttpd /var/www/
buildah run $container chmod -R 750 /var/www/
buildah run $container chmod g+rwx /var/www/
buildah config --cmd "lighttpd -Df /etc/lighttpd/lighttpd.conf" $container
buildah config --volume "/var/www/" $container

buildah commit $container lighttpd_arm
buildah rm $container
