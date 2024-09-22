# !/bin/bash

# cleanup() {
#     echo "Received signal, stopping vsftpd..."
#     pkill -P $$
#     exit 0
# }

# for sig in INT QUIT HUP TERM; do
#   trap "
#     cleanup
#     trap - $sig EXIT
#     kill -s $sig "'"$$"' "$sig"
# done
# trap cleanup EXIT

# echo "Starting vsftpd..."
# /usr/sbin/vsftpd /etc/vsftpd.conf &
# echo "vsftpd started successfully!"

# child_pid=$!

# wait "$child_pid"


cleanup() {
    echo "Received signal, stopping vsftpd..."
    kill -TERM "$child_pid"
    # wait "$child_pid"
    pkill -P $$
    exit 0
}

# Set up signal traps
# trap cleanup QUIT TERM INT EXIT

for sig in INT QUIT HUP TERM; do
  trap "
    cleanup
    trap - $sig EXIT
    kill -s $sig "'"$$"' "$sig"
done
trap cleanup EXIT

# Start vsftpd
echo "Starting vsftpd..."
/usr/sbin/vsftpd /etc/vsftpd.conf &
echo "vsftpd started successfully!"

# Store the PID of vsftpd
child_pid=$!

# Wait for vsftpd to exit
wait "$child_pid"