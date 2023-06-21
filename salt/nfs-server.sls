
nfs-package:
  pkg.installed:
    - name: nfs-kernel-server

file /opt/communism:
  file.directory:
    - name: /opt/communism
    - dir_mode: 777
    - file_mode: 777
/etc/exports:
  file.managed:
    - name: /etc/exports
    - source: salt://nfs/exports

/etc/default/nfs-kernel-server:
  file.managed:
    - name: /etc/default/nfs-kernel-server
    - source: salt://nfs/nfs-kernel-server

/etc/default/nfs-common:
  file.managed:
    - name: /etc/default/nfs-common
    - source: salt://nfs/nfs-common

/etc/nfs.conf:
  file.managed:
    - name: /etc/nfs.conf
    - source: salt://nfs/nfs.conf

/etc/modprobe.d/antialteration.conf:
  file.managed:
    - name: /etc/modprobe.d/antialteration.conf
    - source: salt://nfs/antialteration.conf

nfs-server-s:
  service.running:
    - name: nfs-kernel-server
    - enable: True
    - reload: True
