#!/bin/bash

# grafana-cli  --homepath /usr/share/grafana plugins install grafana-github-datasource

grafana-cli plugins install grafana-github-datasource
# grafana-cli --pluginsDir "/var/lib/grafana/plugins" --homepath /usr/share/grafana plugins install grafana-github-datasource

# mkdir -p /var/lib/grafana/plugins

# wget https://github.com/grafana/github-datasource/releases/download/v1.8.2/grafana-github-datasource-1.8.2.linux_amd64.zip -O ./grafana-github-datasource.zip

# unzip ./grafana-github-datasource.zip && rm -rf ./grafana-github-datasource.zip

# mv ./grafana-github-datasource /var/lib/grafana/plugins/grafana-github-datasource

# chown -R grafana:grafana /var/lib/grafana/plugins

exec grafana-server --homepath /usr/share/grafana --config /grafana.ini