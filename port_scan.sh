host=$1
start_port=$2
end_port=$3

function port_scan() {
    for ((port=$start_port; port<=$end_port; port++))
    do
        timeout 1 bash -c "echo > /dev/tcp/$host/$port" 2>/dev/null &&
            echo "Port $port is open" ||
            echo "Port $port is closed"
    done
}
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <host> <start_port> <end_port>"
    exit 1
fi

port_scan
