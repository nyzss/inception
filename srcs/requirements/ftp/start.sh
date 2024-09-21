#!/bin/bash

handle_signal() {
    echo "Received signal, stopping vsftpd..."
    kill -TERM "$child_pid"
    wait "$child_pid"
    exit 0
}

# Set up signal traps
trap handle_signal QUIT TERM INT EXIT

# Start vsftpd
echo "Starting vsftpd..."
/usr/sbin/vsftpd /etc/vsftpd.conf &
echo "vsftpd started successfully!"

# Store the PID of vsftpd
child_pid=$!

# Wait for vsftpd to exit
wait "$child_pid"