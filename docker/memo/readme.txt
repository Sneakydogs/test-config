#vi /etc/docker/daemon.json

{"allow-nondistributable-artifacts": ["192.168.56.104:5000"]}

#systemctl daemon-reload 
#systemctl restart docker


开启docker远程
# /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376 -H unix:///var/run/docker.sock
    

