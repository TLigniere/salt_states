upgrade:
  cmd.run:
    - name: "apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean"
