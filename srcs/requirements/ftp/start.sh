#!/bin/bash

cleanup() {
    echo "Received signal, stopping vsftpd..."
    pkill -P $$
    exit 0
}

for sig in INT QUIT HUP TERM; do
  trap "
    cleanup
    trap - $sig EXIT
    kill -s $sig "'"$$"' "$sig"
done
trap cleanup EXIT

echo "Starting vsftpd..."
/usr/sbin/vsftpd /etc/vsftpd.conf &
echo "vsftpd started successfully!"

child_pid=$!

wait "$child_pid"