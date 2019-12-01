# Docker based HackMd for SNA lab2

### Requirements:
- Preinstalled docker on remote machine

### Preparation:
1. Clone this repo to remote machine
2. Add your local machine's public key to sshd-configuration/authorized_keys file

### Run with docker-compose:


    docker-compose up -d

### Run without docker-compose:


     ./run-without-docker-compose.sh
    
### Stopping:


     ./stop-it.sh

### Tunneling to local machine:


    ssh -L YOUR_PORT:hackmd:3000 root@REMOTE_MACHINE_ADDRESS -p 23

### To access app: 
>http://localhost:YOUR_PORT
