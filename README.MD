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

Remember the ports :

3306 for MySQL / Mariadb
3000 for Grafana
9090 for Prometheus
9100 for Node_exporters
4505/4506 for Salt (ports open only on the master)

