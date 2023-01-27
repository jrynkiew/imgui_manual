#!/bin/bash

. ./tools/setenv.sh 

if [ -x "$(command -v git)" ]; then
    echo "${gold}git version${reset}"
    git --version
else
    echo "${gold}Installing git${reset}"
    sudo apt-get install git
fi

if [ -x "$(command -v docker)" ]; then
    echo "${gold}docker version${reset}"
    docker --version
else
    echo "${gold}Installing docker${reset}"
    sudo apt-get install docker
fi

if [ -x "$(command -v docker-compose)" ]; then
    echo "${gold}docker-compose version${reset}"
    docker-compose --version
else
    echo "${gold}Installing docker-compose${reset}"
    sudo apt-get install docker-compose
fi

dpkg -s libglfw3:amd64 &> /dev/null

if [ $? -eq 0 ]; then
    echo "${green}Dependency packages already installed! Nothing to do${reset}"
else
    sudo apt install libglfw3
fi

echo -e "${gold}Initializing git repo and dependencies${reset}"
git submodule update --init --recursive
banner

# export COMMAND="sh './build/run.sh'"
export COMMAND="sleep infinity"
      
echo -e "Starting docker-compose script: \n${green}docker-compose -p JRPC-linux-buildsystèmes -f $jrpc_beta/build/build-Linux.yaml up --no-deps --build${reset}"
docker-compose -p JRPC-linux-buildsystèmes -f $jrpc_beta/build/build-Linux.yaml up --no-deps --build 
#docker exec -it imgui_nft_app /bin/bash
