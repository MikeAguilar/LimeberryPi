# Start with Alpine OS as the base image
FROM alpine:3.14

# Install packages
RUN apk update && apk add hostapd iw dhcp vim iptables

# Configure Hostapd (WiFi Access Point OPEN by default)
ADD appconfig/hostapd_conf_files/hostapd_open.conf /etc/hostapd/hostapd.conf

# Configure DHCPD
ADD appconfig/dhcpd.conf /etc/dhcp/dhcpd.conf
RUN touch /var/lib/dhcp/dhcpd.leases

# Configure networking
ADD appconfig/interfaces /etc/network/interfaces
ADD appconfig/iptables.sh /iptables.sh
ADD appconfig/iptables_off.sh /iptables_off.sh

# Copy and execute init file
ADD appconfig/start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]
