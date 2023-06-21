
Syncs the media of the Wordpress servers everyday into the NFS server:
  cron.present:
    - name: rsync -avu {{ pillar["copied-file"] }} {{ pillar["nfs-source"] }}
    - user: root
    - minute: 0
    - hour: 1

Syncs the media of the Wordpress servers everyday from the NFS server:
  cron.present:
    - name: rsync -avu  {{ pillar["nfs-source-to-copy"] }} {{ pillar["copied-file-synced"] }} && chown -R www-data:www-data {{ pillar["copied-file-synced"] }}
    - user: root
    - minute: 0 
    - hour: 2



