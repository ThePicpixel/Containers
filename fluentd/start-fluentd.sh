
podman run --pod opendistro --name opendistro.fluentd --rm -d  -v /home/thepicpixel/Containers/fluentd/conf:/fluentd/etc -v /var/log/audit:/fluentd/log localhost/fluentd-elasticsearch
