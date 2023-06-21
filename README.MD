Download salt-master on this machine and salt-minion on the ones you want to control 
Put all the files of this repo inside /srv

You must edit the file in /etc/salt
it will either be master or minion
both of them are the configuration files
minion_id is the id the minion will have, so you better change for your comfort
without config, the minions will search the master trough ssh so change the line where you can see master : salt to master : <salt master IP>

###################### GENERAL SETUP #################################
These files are incomplete for the whole setup or straight up useless for a completely local configuration so check them quickly (most of the time the names of the files speaks for themselves but still);
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
5001 for alertmanager
4505/4506 for Salt (ports open only on the master)

#################### GRAFANA ########################

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

############# ALERTMANAGER ################

you'll need to change the email of the receiver or i will be the one who receives everything,
i don't mind sharing the gmail account that sends the alert, just don't fuck it up

The file to change is salt/prometheus/alertmanager-0.25.0.linux-amd64/alertmanager.yml

if you want to create new alerts or delete the olds ones then change /salt/prometheus/rules_prometheus.yml
(quick tips: verify your expr on your prometheus website)

################# PROMETHEUS ################

Change the address inside IPaddress.sls inside the pillars, the state will add automatically every host;
each time prometheus.sls is triggered, the node_exporters targets are deleted then reconfigured each time,
That's the way i found to avoid duplication in my targets who would stop my prometheus

QUICK SUMMARY :
 the IP address in IPaddress.sls and haproxy.cnf should be the only ones that you need to change and the top.sls depending on what you need on which machine
