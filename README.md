# docker-jumpbox

Re-work of warden/docker-jumphost which is an extended Docker image to run an SSH server.

Expected volumes:
* authorized-keys:/authorized-keys authorized

USAGE:
```
docker run --name ssh_server -d -e USER=`whoami` -v ${PWD}/keys:/keys geekinutah/docker-ssh-jumpbox
```

where:
* USER - username allowed to log in
* ${PWD}/authorized-keys - path to file containing user's SSH public keys

The modificaitons made to warden/docker-jumphost are specifically to accomodate attaching a single user to an alternative network namespace.
For example, let's say you are using ekristen/openvpn-client to isolate a VPN connection. You can then use this ssh server to provide a jumpbox into that network namespace.

```
docker run --net container:openvpn -d -e USER=`whoami` -v ${PWD}/authorized-keys:/authorized-keys geekinutah/ssh-jumpbox
```
