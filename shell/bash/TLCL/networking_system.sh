## ping

# to see if we can reach linuxcommand.org
# we can use ping like this
$ ping linuxcommand.org
PING linuxcommand.org (66.35.250.210) 56(84) bytes of data.
64 bytes from vhost.sourceforge.net (66.35.250.210): icmp\_seq=1
ttl=43 time=107 ms
64 bytes from vhost.sourceforge.net (66.35.250.210): icmp\_seq=2
ttl=43 time=108 ms
64 bytes from vhost.sourceforge.net (66.35.250.210): icmp\_seq=3
ttl=43 time=106 ms
...
# once started, ping continues to send packets at a specified interval
#   until it is interrupted
# after it is interrupted by pressing C-c
#   ping prints performance statistics
# a successful "ping" will indicate that the elements of the network
#   including its interface cards, cabing, routing and gateways
#   are in generally good working order

## traceroute

# to see the route taken to reach slashhot.org
$ traceroute slashdot.org
traceroute to slashdot.org (216.34.181.45), 30 hops max, 40 byte
packets
1 ipcop.localdomain (192.168.1.1) 1.066 ms 1.366 ms 1.720 ms
2 * * *
3 ge-4-13-ur01.rockville.md.bad.comcast.net (68.87.130.9) 14.622
ms 14.885 ms 15.169 ms
4 po-30-ur02.rockville.md.bad.comcast.net (68.87.129.154) 17.634
ms 17.626 ms 17.899 ms
...
# in the output, we can see that connecting from our test system
#   to slashdot.org requires traversing sixteen routers
#   for routers that provide identifying information
#     we see their host names, IP addresses and performance data
#       which includes three samples of round-trip time
#       from the local system to the router
#   for routers that do not provide identifying information
#     because of router configuration, network congestion, firewalls, etc.
#     we can see asterisks as in the line for hop number two

## netstat
