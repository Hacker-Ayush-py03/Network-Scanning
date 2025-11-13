# Network-Scanning
 ***Scan Report of  Local Network for Open Ports***

🎯 _Objective_

To discover open ports and running services on devices within your local network, helping you understand network exposure and potential vulnerabilities.

🧰 _Tools_

* Nmap (Powerful open-source network scanner)

* VWireshark (optional for packet-level analysis)

📘 _Step-by-Step Guide_

1. _Install Nmap :_
   
* Official download: https://nmap.org/download.html

* On Linux/macOS:
    ```bash
    sudo apt install nmap -y
    ```
   or
    ```bash
     brew install nmap
    ```

2._Find Your Local IP Range:_

  * _Run:_
 ```bash
 ipconfig       # (Windows)
 ifconfig       # (Linux/macOS)
 ```
 * Example subnet: 192.168.1.0/24 → This covers IPs from 192.168.1.1 to 192.168.1.254.

3. _Run Nmap TCP SYN Scan_
 
 ```bash
 nmap -sS 192.168.1.0/24
 ```

* _Explanation:_
  

* -sS → TCP SYN scan (half-open scan, stealthy and fast)

* /24 → Scans the entire subnet
 

4. _Note Open Ports:_

 * _Nmap output will show:_
 ```bash
 PORT     STATE SERVICE
 22/tcp   open  ssh
 80/tcp   open  http
 139/tcp  open  netbios-ssn
 445/tcp  open  microsoft-ds
 ```

5._Capture Packets with Wireshark:_
   
 * _Filter:_
```bash
tcp.port == 80 or tcp.port == 22
```
You can analyze TCP handshake packets (SYN, SYN-ACK, ACK) to understand the scanning process.

6. _Research Common Services:_

 * _Look up what services run on the open ports:_
 

* 22 → SSH (Remote access)

* 80 → HTTP (Web server)

* 445 → SMB (File sharing)
 

7. _Identify Risks:_

  * Open ports expose services — if misconfigured, they can be exploited.
  Example:

 * SMB (445) is a known attack vector for ransomware.

  * SSH (22) brute force is common if weak passwords exist.

 8. _Save Results:_

* Export scan results to a text or HTML file:
 ```bash
 nmap -sS 192.168.1.0/24 -oN results.txt
 nmap -sS 192.168.1.0/24 -oX results.xml
 ```

9. _Network Port Scanner Bash Script:_
    
 * This Bash script uses nmap to perform a TCP SYN scan (-sS) against your detected local IP range. It installs required tools (on Debian/Ubuntu systems), runs the scan, saves results in multiple nmap     formats (.nmap, .xml, .gnmap) and converts the XML output to an HTML report using xsltproc. Output filenames include a timestamp to avoid overwriting previous runs.
 

 * Attempts to detect the local network CIDR (e.g., 192.168.1.0/24). This is a simple heuristic and may not be correct on all setups.

 ```bash
 ip_range=$(ip route | grep -oP '(\d+\.){3}\d+/\d+' | head -1)
 ```

*  Runs a TCP SYN scan and writes .nmap, .xml, and .gnmap outputs:

 ```bash
 nmap -sS "$ip_range" -oA scan_$timestamp — runs a TCP SYN scan and writes .nmap, .xml, and .gnmap outputs.
 ```

 * Converts the Nmap XML to an HTML report:

 ```bash
 xsltproc scan_$timestamp.xml -o report_$timestamp.html — converts the Nmap XML to an HTML report.
 ```

 * Outputs are timestamped (format YYYYmmdd_HHMMSS) to avoid overwriting.

 * _Requirements:_

 * Debian/Ubuntu-like distribution (script uses apt). Modify package-manager commands for other distros.

 * sudo privileges (or root) for installing packages and running the scan.

 * Permission to scan the target network — only scan networks you are authorized to scan.

* _Usage:_

1.Save the script as ```bash network_port_scanner.sh.```

2.Make it executable:

```bash
chmod +x network_port_scanner.sh
```
3.Run it:

```bash
./network_port_scanner.sh
```
4.After completion you will find:

 ```bash scan_<timestamp>.nmap ``` — human-readable Nmap output
 
 ```bash scan_<timestamp>.xml ``` — machine-readable XML output

 ```bash scan_<timestamp>.gnmap ```— greppable Nmap output

 ```bash report_<timestamp>.html ```— HTML report generated from the XML

*  ***_Security & Legal Notice_***

 * Scanning networks without explicit permission may be illegal and unethical. Only use this script on networks you own or have written authorization to test.

* Running nmap -sS requires root privileges; handle with care.

 * The script installs packages using sudo apt; review and approve package installation before running in sensitive environments.

 * _Troubleshooting_

* If ```bash ip_range ``` is empty or incorrect: run ```bash ip route ``` or ```bash ip -o -f inet addr show ``` manually to find the correct CIDR and re-run ```bash nmap ``` with that target.

* If ```bash xsltproc ``` conversion fails: ensure ```bash scan_<timestamp>.xml ``` exists and is a valid Nmap XML file. You can view raw XML or run ```bash xsltproc --version ``` to confirm     
 
  installation.

* Permission errors: run the script as root or with ```bash sudo ``` (but understand the security implications).

💡 Outcome

* Learn network reconnaissance.

* Understand service exposure and attack surface mapping.

    
