docker pull rome314/openssh:latest;
docker pull hackmdio/hackmd:1.3.1-alpine;
docker pull  postgres:11.5-alpine;
docker network create --subnet 172.22.0.0/27 --gateway 172.22.0.1 --internal internal_nw;
docker network create --subnet 172.23.0.0/27 --gateway 172.23.0.1  external_nw;
docker run -dit --name sshd -p 23:22  -v $(pwd)/sshd-configuration/:/root/.ssh -v $(pwd)/sshd-configuration/sshd_config:/etc/ssh/sshd_config rome314/openssh;
docker network connect internal_nw sshd;
docker network connect external_nw sshd;
docker run -dit --name db -e POSTGRES_USER=hackmd -e POSTGRES_PASSWORD=hackmdpass -e PSTGRESDB=hackmd -v database:/var/lib/postgresql/data postgres:11.5-alpine;
docker network connect internal_nw db;
docker network disconnect bridge db;
docker run -dit --name hackmd -e  HMD_DB_URL=postgres://hackmd:hackmdpass@db:5432/hackmd hackmdio/hackmd:1.3.1-alpine;
docker network connect internal_nw hackmd;
docker network disconnect bridge hackmd;






