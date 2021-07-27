# LimeberryPi
Network and other tools for the Raspberry Pi

## Deploying and Running WiFiAP (WiFi Access Point)

## Prepare your Pi:

Even though we are using a Docker image to run all the access point services, we still need to prepare our Raspberry Pi install OS to be able to run some of those tasks.

## Ensure Docker and Docker Compose are installed
https://dev.to/elalemanyo/how-to-install-docker-and-docker-compose-on-raspberry-pi-1mo

## Add your user to the 'docker' group so you don't need to use `sudo` every time you run Docker
Create the docker group first

`sudo groupadd docker`

Add your user to the docker group

`sudo usermod -aG docker $USER`

## Enable IPv4 Forwarding
`sudo sysctl net.ipv4.ip_forward=1`


## Make the change persistent (otherwise it resets after reboot)
Find the file `/etc/sysctl.conf` and ensure the line below is uncommented

```
# Uncomment the next line to enable packet forwarding for IPv4
net.ipv4.ip_forward=1
```

## Disable dhcpd for wlan0

Avoid issues with  dhcpd service, add the following line into the file `/etc/dhcpcd.conf`, making the service ignore the wireless interfaces wlan0 (but still manage wlan0):

`denyinterfaces wlan0`


## Login to Raspberry Pi and download the Limeberry Pi repository from git

`git clone https://github.com/MikeAguilar/LimeberryPi.git`


## Change directory to the WiFiAP application directory

`cd ./LimeberryPi/WiFiAP/`

## Build the WiFiAP Docker Image

`docker build -t wifiap .`

## Reboot your Raspberry Pi
You can reboot your Raspberry Pi from the console using the following command

`sudo shutdown -r now` 

## Start the Access Point using one of the docker-compose YAML files

`docker-compose -f docker-compose-open.yml up -d`

If for any reason, the Access Point is not routing traffic properly, meaning, your WiFi connected devices do not have access to the internet, then try rebooting your Raspberry Pi and try this command again.

## To STOP the Access Point using the same docker-compose YAML file

`docker-compose -f docker-compose-open.yml down`

Once you the Access Point is running, you should be able to see a new WiFi network available to connect. 
You can connect your TV or Gaming Console and from your Raspberry Pi, you will be able to sniff the network traffic from the `wlan0` interface.

# TCPDump examples to sniff traffic
https://hackertarget.com/tcpdump-examples/
