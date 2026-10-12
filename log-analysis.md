# Sample Log Analysis: Detecting Brute-Force Attacks

During log monitoring audits on `/var/log/auth.log`, repeated unauthorized access attempts can be identified and parsed.

## Sample Log Snippet (Simulated Attack)
```text
Oct 12 04:12:05 ubuntu-server sshd[4521]: Failed password for invalid user admin from 192.168.1.105 port 51242 ssh2
Oct 12 04:12:07 ubuntu-server sshd[4521]: Failed password for invalid user admin from 192.168.1.105 port 51242 ssh2
Oct 12 04:12:09 ubuntu-server sshd[4521]: Failed password for invalid user admin from 192.168.1.105 port 51242 ssh2
Oct 12 04:12:10 ubuntu-server fail2ban.actions[310]: NOTICE [sshd] Ban 192.168.1.105