TASK 1 

1. What is the output of “nodes” and “net”
mininet>nodes
        available nodes are:
        c0 h1 h2 h3 h4 h5 h6 h7 h8 s1 s2 s3 s4 s5 s6 s7

mininet> net
        h1 h1-eth0:s3-eth2
        h2 h2-eth0:s3-eth3
        h3 h3-eth0:s4-eth2
        h4 h4-eth0:s4-eth3
        h5 h5-eth0:s6-eth2
        h6 h6-eth0:s6-eth3
        h7 h7-eth0:s7-eth2
        h8 h8-eth0:s7-eth3
        s1 lo:  s1-eth1:s2-eth1 s1-eth2:s5-eth1
        s2 lo:  s2-eth1:s1-eth1 s2-eth2:s3-eth1 s2-eth3:s4-eth1
        s3 lo:  s3-eth1:s2-eth2 s3-eth2:h1-eth0 s3-eth3:h2-eth0
        s4 lo:  s4-eth1:s2-eth3 s4-eth2:h3-eth0 s4-eth3:h4-eth0
        s5 lo:  s5-eth1:s1-eth2 s5-eth2:s6-eth1 s5-eth3:s7-eth1
        s6 lo:  s6-eth1:s5-eth2 s6-eth2:h5-eth0 s6-eth3:h6-eth0
        s7 lo:  s7-eth1:s5-eth3 s7-eth2:h7-eth0 s7-eth3:h8-eth0
        c0

2. What is the output of “h7 ifconfig”
mininet>h7 ifconfig
        h7-eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
                inet 10.0.0.7  netmask 255.0.0.0  broadcast 10.255.255.255
                inet6 fe80::204e:c8ff:fe1f:f0c3  prefixlen 64  scopeid 0x20<link>
                ether 22:4e:c8:1f:f0:c3  txqueuelen 1000  (Ethernet)
                RX packets 96  bytes 7176 (7 KB)
                RX errors 0  dropped 0  overruns 0  frame 0
                TX packets 13  bytes 1006 (1 KB)
                TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

        lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
                inet 127.0.0.1  netmask 255.0.0.0
                inet6 ::1  prefixlen 128  scopeid 0x10<host>
                loop  txqueuelen 1  (Local Loopback)
                RX packets 0  bytes 0 (0.0 B)
                RX errors 0  dropped 0  overruns 0  frame 0
                TX packets 0  bytes 0 (0.0 B)
                TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

TASK 2

1. Draw the function call graph of this controller. For example, once a packet comes to the
controller, which function is the first to be called, which one is the second, and so forth?
        >_handle_PacketIn() -> act_like_hub() -> resend_packet()

2. Have h1 ping h2, and h1 ping h8 for 100 times (e.g., h1 ping -c100 p2).
a. How long does it take (on average) to ping for each case?
    > h1-h2: avgerage = 1.745 ms | h1-h8:avgerage = 4.454 ms
b. What is the minimum and maximum ping you have observed?
    > h1-h2: minimum = 1.097 ms, maximum = 2.393 ms | h1-h8: minimum 4.123 ms, maximum = 27.789 ms
c. What is the difference, and why?
    > We created a network with a binary tree topology, which means that some computers were located closer to each other than others. When we measured the ping time between two computers that were close together in the tree, the ping time was relatively short and consistent. However, when we measured the ping time between two computers that were far apart in the tree, the ping time was longer and more variable.

3. Run “iperf h1 h2” and “iperf h1 h8”
a. What is “iperf” used for?
    > Iperf is a software tool that helps to measure how fast data can be sent and received over a network connection. It is used to check the performance and capacity of a network and to identify areas that might need improvement.
b. What is the throughput for each case?
    > h1 - h2 : ['7.38 Mbits/sec','8.89 Mbits/sec']
      h1 - h8 : ['3.56 Mbits/sec','3.98 Mbits/sec']
c. What is the difference, and explain the reasons for the difference.
    > The difference in throughput between the two cases is due to the distance between the hosts ands the network topology.

4. Which of the switches observe traffic? Please describe your way for observing such
traffic on switches (e.g., adding some functions in the “of_tutorial” controller).
    > We can observe the traffic on switches by modifying the _handle_PacketIn() function in the controller script. This will allow us to call a function whenever a packet is received by a switch and sent to the controller for processing. By adding some logging statements in this function, we can print out information about the packet and the switch that sent it.

Task 3

1. Describe how the above code works, such as how the "MAC to Port" map is established.
You could use a ‘ping’ example to describe the establishment process (e.g., h1 ping h2).
    >

2. (Comment out all prints before doing this experiment) Have h1 ping h2, and h1 ping
h8 for 100 times (e.g., h1 ping -c100 p2).
a. How long did it take (on average) to ping for each case?
    >h1 ping h2: Average is 1.745 ms, h1 ping h8: Average is 4.745 ms

b. What is the minimum and maximum ping you have observed?
    > h1 ping h2 : Minimum is 1.082 and Maximum is 2.342 image.
      h1 ping h8 : Minimum is 4.082 and Maximum is 6.342 image.

c. Any difference from Task 2 and why do you think there is a change if there is?
    > The duration of the pings is reduced in comparison to Task 2 as the switches are now aware of the destination ports after the initial packet flood. Therefore, instead of sending the packets to all ports, the switches can send them directly to the specific destination port, resulting in faster transmission.

3. Q.3 Run “iperf h1 h2” and “iperf h1 h8”.
a. What is the throughput for each case?
    > h1-h2 between 7.38 Mbits/sec and 8.89 Mbits/sec
      h1-h8 between 3.56 Mbits/sec and 3.98 Mbits/sec

b. What is the difference from Task 2 and why do you think there is a change if
there is?
    > When h1 communicates with h2, it can transfer more data within a given time frame because the sender already knows where to send the data, so it's faster. However, there is not much change in throughput when h1 communicates with h8 because the network path still involves many switches, and the mapping might not have a significant effect on the short time taken for the "iperf" measurement.