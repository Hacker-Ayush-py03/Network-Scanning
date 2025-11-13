🧠 Interview Questions and Answers

#	***Question	Answer***

1. What is an open port?	

    A network port that is actively listening for connections and can accept incoming traffic.

2. How does Nmap perform a TCP SYN scan?
 
    It sends a TCP SYN packet to the target; if it receives SYN-ACK → port open; RST → closed. It doesn’t complete the handshake (stealth scan).

3.	What risks are associated with open ports?	

     Attackers can exploit open ports to gain unauthorized access, run exploits, or perform reconnaissance.

5.	Explain TCP vs UDP scanning.	

      TCP scanning uses connection-oriented handshakes, while UDP scanning tests connectionless services — slower and less reliable.

	   | TCP Scan |	 UDP Scan |
  	   |----------|-----------|
       |Connection-oriented|	Connectionless
       |Reliable responses	|Unreliable responses
       |Faster scanning	|Slower scanning
       |SYN/RST packets|	Specific UDP payloads

7.	How can open ports be secured?
  
	   Close unused ports, use firewalls, enable intrusion detection, and patch services.

8.	What is a firewall’s role?	

      Filters network traffic; blocks unauthorized connections to/from ports.
  	
9.	Why do attackers perform port scans?
     
       To map active services and identify potential vulnerabilities before exploiting them.
   	
10.	How does Wireshark complement port scanning?
   
     It helps visualize and analyze network packets during scans, revealing the TCP/UDP handshakes and responses.
