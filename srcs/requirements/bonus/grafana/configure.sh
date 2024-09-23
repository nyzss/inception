#!/bin/bash

grafana-cli plugins install grafana-github-datasource

exec grafana-server --homepath /usr/share/grafana --config /grafana.ini