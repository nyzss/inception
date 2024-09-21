#!/bin/bash

echo "Started grafana!"

exec grafana-server --homepath "/usr/share/grafana" --config /grafana.ini