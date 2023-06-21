

These files are incomplete for the whole setup;
you'll need to download wordpress and prometheus file;
the sls may refuse your files if the version are different;

The IPs of the machines need to be edited in the pillar "IPaddress";

The redundancy system on the mariadb (master - master) is not configured in the states, you'll either need to improve it or to do it manually;

The file of haproxy may need to be changed for the IPs

Remember the ports :

3306 for MySQL / Mariadb
3000 for Grafana
9090 for Prometheus
9100 for Node_exporters

