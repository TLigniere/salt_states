
nfs-client-package:
  pkg.installed:
    - name: nfs-common

/opt/nfs:
  file.directory:
    - name: /opt/nfs

/opt/nfs/source:
  file.directory:
    - name: /opt/nfs/source

/etc/default/nfs-common:
  file.managed:
    - name: /etc/default/nfs-common
    - source: salt://nfs/nfs-common     

/etc/fstab:
  file.append:
    - name: /etc/fstab
    - text: {{ pillar["LAB-server"] }}:/opt/communism /opt/nfs/source nfs defaults,user,auto,_netdev,bg,vers=4.0 

mount directory /opt/nfs/source:
  cmd.run:
    - name: "mount -t nfs {{ pillar["LAB-server"] }}:/opt/communism /opt/nfs/source"
