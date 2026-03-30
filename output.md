# Firefox Audit - Script Execution Outputs

This document contains simulated terminal outputs for the 5 audit scripts.

---

## 1. System Identity Report (`01-identify.sh`)
```bash
Anand2k29@ubuntu-server:~/Firefox$ ./01-identify.sh
================================================================================
                   Firefox AUDIT - SYSTEM IDENTITY                    
================================================================================
Linux Distribution: Ubuntu 22.04.3 LTS
Kernel Version:     5.15.0-89-generic
Current User:       Anand2k29
Home Directory:     /home/Anand2k29
System Uptime:      up 2 hours, 45 minutes
Current Date/Time:  Mon Mar 30 2026 20:53:22 GMT+0000 (Coordinated Universal Time)
--------------------------------------------------------------------------------
Message: This system runs on Open Source software, providing freedom to study, change, and distribute.
================================================================================
```

---

## 2. FOSS Package Inspector (`02-packages.sh`)
```bash
Anand2k29@ubuntu-server:~/Firefox$ ./02-packages.sh
================================================================================
                   Firefox AUDIT - PACKAGE INSPECTOR                 
================================================================================
Status: firefox is INSTALLED on this Linux system.
Version: 130.0+build20240601
--------------------------------------------------------------------------------
FOSS Philosophy Notes:
 - Firefox: A modern web browser that champions open standards and community-driven development.
 - LibreOffice: A full‑featured office suite that respects user freedom and data portability.
 - GIMP: An image manipulation program that provides professional capabilities without proprietary lock‑in.
 - VLC: A versatile media player that supports countless formats, all under a permissive license.
================================================================================
```

---

## 3. Disk and Permission Auditor (`03-auditor.sh`)
```bash
Anand2k29@ubuntu-server:~/Firefox$ ./03-auditor.sh
Directory                       Size       Perms      Owner
---------                       ----       -----      -----
/etc                            45M        drwxr-xr-x root
/var/log                        120M       drwxr-xr-x syslog
/usr/share                      1.2G       drwxr-xr-x root
/opt                            300M       drwxr-xr-x root
/usr/lib/firefox                250M       drwxr-xr-x root
/home/Anand2k29/.mozilla/firefox N/A        N/A        N/A
```

---

## 4. Log File Analyzer (`04-logs.sh`)
```bash
Anand2k29@ubuntu-server:~/Firefox$ ./04-logs.sh /var/log/syslog error
Keyword 'error' found 7 times in /var/log/syslog.
Last 5 matching entries:
Mar 30 20:45:12 hostname firefox[1234]: [Error] Failed to load resource: net::ERR_CONNECTION_RESET
Mar 30 20:46:03 hostname firefox[1234]: [Error] Unexpected shutdown detected
Mar 30 20:47:27 hostname firefox[1234]: [Error] Add-on installation failed
Mar 30 20:48:55 hostname firefox[1234]: [Error] Certificate verification failed
Mar 30 20:50:11 hostname firefox[1234]: [Error] Unable to write to profile directory
```

---

## 5. Open Source Manifesto Generator (`05-manifesto.sh`)
```bash
Anand2k29@ubuntu-server:~/Firefox$ ./05-manifesto.sh
What is your favorite open-source project? Firefox
State a personal principle you uphold in software development: Code should be transparent and auditable.
How will you contribute to the open-source community? By submitting patches and writing documentation.
Your manifesto has been saved to Anand2k29.txt.
```
