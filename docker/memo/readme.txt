#vi /etc/docker/daemon.json

{
   "allow-nondistributable-artifacts": ["192.168.227.180:5000"],
   "insecure-registry": ["192.168.227.180:5000"]
}

#systemctl daemon-reload 
#systemctl restart docker

docker.service

insecure-registry=192.168.56.104:5000


开启docker远程
# /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock
    

