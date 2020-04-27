podman run -ti --publish 9880:9880 --rm -v /tmp:/fluentd/etc fluentd -c /fluentd/etc/fluent.conf -v
