
wget -cO - https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/entrypoint.sh.erb > entrypoint.sh
wget -cO - https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/fluent.conf.erb > fluent.conf

chmod +x entrypoint.sh

mkdir -p plugins

curl https://raw.githubusercontent.com/fluent/fluentd-docker-image/master/Dockerfile.sample > Dockerfile
