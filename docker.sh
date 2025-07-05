##########################################################################################
####### DOCKER BASH FOR MAGENTO PROJECT  #################################################
##########################################################################################

#### Start Project
tt_start() {
    # Down just in case
    echoColor "Reset container just in case to start clean" "yellow"; echo;
    docker-compose -f ./tt/docker/ docker-compose.yml down;
    echo;echo;

    # Start project
    echoColor "Start project" "green"; echo;
    docker-compose -f ./tt/docker/docker-compose.yml up;
}


#### Stop project completly
tt_kill() {
    docker-compose -f ./tt/docker/docker-compose.yml down;
}

tt_dockerRebuild() {
   docker-compose -f ./tt/docker/docker-compose.yml up --build;
}






tt_composer() {
    tt_dockerRunRootCMDPHP "composer $@";
}

tt_symfony() {
    tt_dockerRunRootCMDPHP "symfony $@";
}


tt_npm() {
    tt_dockerRunRootCMDPHP "npm $@";
}



##########################################################################################
## Docker / Project local - Useful Cmds
## Connect to containers
##########################################################################################

#### CONNECT CONTAINER CMDs
tt_dockerConnectPHP() {
    docker exec -it `docker ps --filter="name=php" -q` /bin/bash;
}
tt_dockerConnectNginx() {
    docker exec -it `docker ps --filter="name=nginx" -q` /bin/bash;
}
tt_dockerConnectNginxRoot() {
    docker exec -it --user=root `docker ps --filter="name=nginx" -q` /bin/bash;
}
tt_dockerConnectPHPRoot() {
    docker exec -it --user=root `docker ps --filter="name=php" -q` /bin/bash;
}


#### RUN CMDs TO DEPLOY CONTAINERS CMDs
tt_dockerRunRootCMDPHP() {
    docker exec -it `docker ps --filter="name=php" -q` bash -c "$@";
}


tt_dockerRunCMDNginx() {
    docker exec -it --user=www `docker ps --filter="name=nginx" -q` bash -c "$@";
}
tt_dockerRunCMDNginxyRoot() {
    docker exec -it `docker ps --filter="name=nginx" -q` bash -c "$@";
}




tt_dockerConnect() {
    docker exec -it `docker ps --filter="name=$1" -q` /bin/bash;
}