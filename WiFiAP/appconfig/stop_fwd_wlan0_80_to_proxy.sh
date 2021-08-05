#/bin/sh

# Rules below are to send traffic to a Proxy on the same network for port 80 (http)
#iptables -t nat -A PREROUTING -i wlan0 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080

iptables -t nat -F PREROUTING
iptables -t nat -F POSTROUTING
iptables -t nat -D PREROUTING -i wlan0 -p tcp -m tcp --dport 80 -j DNAT --to-destination 192.168.20.60:8888  # Note that you must replace the IP:Port to match your own
iptables -t nat -D PREROUTING -i wlan0 -p udp -m udp --dport 80 -j DNAT --to-destination 192.168.20.60:8888  # Note that you must replace the IP:Port to match your own