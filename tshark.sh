# airmon-ng start wlan0
# tshark -i mon0 -s 256 type mgt subtype probe-req -T fields -e wlan_mgt.ssid -w /tmp/probe.pcap
while true; do 
	tshark -r /tmp/probe.pcap -T fields -e wlan_mgt.ssid 2> /dev/null | uniq | grep -v ^$ >> /tmp/probes.txt
	sleep 5
done
