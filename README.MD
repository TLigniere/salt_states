Download salt-master on this machine and salt-minion on the ones you want to control 

You must edit the file in /etc/salt
it will either be master or minion
both of them are the configuration files
minion_id is the id the minion will have, so you better change for your comfort
without config, the minions will search the master trough ssh so change the line where you can see master : salt to master : <salt master IP>

These files are incomplete for the whole setup;
you'll need to download wordpress and prometheus file;
the sls may refuse your files if the version are different;

The IPs of the machines need to be edited in the pillar "IPaddress";

The redundancy system on the mariadb (master - master) is not configured in the states, you'll either need to improve it or to do it manually;

The file of haproxy may need to be changed for the IPs

The files prometheus.yml, prometheus.service and rules_prometheus.yml must be put inside the dir. of prometheus once it's downloaded
The IP in rules_prometheus must be edited, otherwise it won't listen to anything

you will need to edit the mysql file for wordpress, otherwise the haproxy might not work anymore so change the paths


Remember the ports :

3306 for MySQL / Mariadb
3000 for Grafana
9090 for Prometheus
9100 for Node_exporters
4505/4506 for Salt (ports open only on the master)

for grafana here's 5 useful query :

CPU Usage :
(1 - avg(irate(node_cpu_seconds_total{mode="idle"}[1m])) by (hostname)) * 100

RAM usage :
100 * (1 - ((avg_over_time(node_memory_MemFree_bytes[10m]) + avg_over_time(node_memory_Cached_bytes[10m]) + avg_over_time(node_memory_Buffers_bytes[10m])) / avg_over_time(node_memory_MemTotal_bytes[10m])))

Disk Usage : 
100 - ((node_filesystem_avail_bytes{mountpoint="/",fstype!="rootfs"} * 100) /            node_filesystem_size_bytes{mountpoint="/",fstype!="rootfs"})

Node_exporters UP :
up{job="node_exporter"}

Service on a machine up (for example, this one checks on the target WP-server if apache is running) :
node_systemd_unit_state{hostname="WP-server-Node_exporter",name="apache2.service",state="active"}==1

