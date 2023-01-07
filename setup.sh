#!/bin/bash


# Colour codes for output
RED='\033[0;31m' # Red colour
GREEN='\033[0;32m' # Green colour
BLUE='\033[0;34m' # Blue colour
CYAN='\033[0;36m' # Cyan colour
BIWhite='\033[1;97m' # White
BWHITE='\033[1;37m'  # Bold White colour

# Banner function
function intro {
echo -e "${BWHITE}  ____        _    ____  _            _   _"     
echo -e "${BWHITE} / ___| _   _| |__/ ___|| | ___ _   _| |_| |__  "
echo -e "${BWHITE} \___ \| | | | '_ \___ \| |/ _ \ | | | __| '_ \ "
echo -e "${BWHITE}   __) | |_| | |_) |__) | |  __/ |_| | |_| | | |"
echo -e "${BWHITE} |____/ \__,_|_.__/____/|_|\___|\__,_|\__|_| |_|"
echo -e "${BWHITE}			-By HacktivistRO"
echo -e ""
}

clear
intro
sleep 3
echo -e "${CYAN}Installing the tools required for SubSleuth${BWHITE}"


sudo apt update
sudo apt install wget
sudo apt install curl

# Install Go Language
echo -e "${BLUE}Installing Go Language now!${BWHITE}"
mkdir go-lang
cd go-lang
wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo 'export PATH=$PATH:/usr/local/go/bin' >> /root/.bash_profile
source /root/.bash_profile
cd ../
rm -rf go-lang


# Install Cero
echo -e "${BLUE}Installing Cero now!${BWHITE}"
wget https://github.com/glebarez/cero/releases/download/v1.3.0/cero-linux-amd64
mv cero-linux-amd64 cero
chmod +x cero
sudo mv cero /usr/bin
echo -e "${GREEN}Cero installed.${BWHITE}"
sleep 2
clear
intro
echo -e "${GREEN}Cero installed.${BWHITE}"

# Install subfinder
echo -e "${BLUE}Installing SubFinder now!${BWHITE}"
mkdir subfinder
cd subfinder
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.5.5/subfinder_2.5.5_linux_amd64.zip
unzip subfinder_2.5.5_linux_amd64.zip
chmod +x subfinder
sudo mv subfinder /usr/bin/
cd ..
rm -r subfinder
echo -e "${GREEN}Subfinder installed.${BWHITE}"
sleep 2
clear
intro
echo -e "${GREEN}Cero installed.${BWHITE}"
echo -e "${GREEN}Subfinder installed.${BWHITE}"

# Install CSPRecon
echo -e "${BLUE}Installing CSPRecon now!${BWHITE}"
mkdir csprecon
cd csprecon
wget https://github.com/edoardottt/csprecon/archive/refs/tags/v0.0.4.zip 
unzip v0.0.4.zip
cd csprecon-0.0.4/cmd/csprecon
go build
chmod +x ./csprecon
sudo mv ./csprecon /usr/bin
cd ../../../../
rm -rf csprecon
echo -e "${GREEN}CSPRecon installed.${BWHITE}"
sleep 2
clear
intro
echo -e "${GREEN}Cero installed.${BWHITE}"
echo -e "${GREEN}Subfinder installed.${BWHITE}"
echo -e "${GREEN}CSPRecon installed.${BWHITE}"

# Install Amass
echo -e "${BLUE}Installing Amass now!${BWHITE}"
mkdir Amass
cd Amass
wget https://github.com/OWASP/Amass/releases/download/v3.21.2/amass_linux_amd64.zip
unzip amass_linux_amd64.zip
cd amass_linux_amd64
chmod +x amass
sudo mv amass /usr/bin
cd ../../
rm -rf Amass
echo -e "${GREEN}Amass installed.${BWHITE}"
sleep 2
clear
intro
echo -e "${GREEN}Cero installed.${BWHITE}"
echo -e "${GREEN}Subfinder installed.${BWHITE}"
echo -e "${GREEN}CSPRecon installed.${BWHITE}"
echo -e "${GREEN}Amass installed.${BWHITE}"

# Install OpenSSL
echo -e "${BLUE}Installing OpenSSL now!${BWHITE}"
sudo apt update
sudo apt install -y openssl
echo -e "${GREEN}OpenSSL installed.${BWHITE}"
sleep 2
clear
intro
echo -e "${GREEN}Cero installed.${BWHITE}"
echo -e "${GREEN}Subfinder installed.${BWHITE}"
echo -e "${GREEN}CSPRecon installed.${BWHITE}"
echo -e "${GREEN}Amass installed.${BWHITE}"
echo -e "${GREEN}OpenSSL installed.${BWHITE}"

# Install Findomain
echo -e "${BLUE}Installing Findomain now!${BWHITE}"
mkdir findomain
cd findomain
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
unzip findomain-linux.zip
chmod +x findomain
sudo mv findomain /usr/bin/findomain
cd ../
rm -rf findomain
echo -e "${GREEN}Findomain installed.${BWHITE}"
clear
intro
echo -e "${GREEN}Cero installed.${BWHITE}"
echo -e "${GREEN}Subfinder installed.${BWHITE}"
echo -e "${GREEN}CSPRecon installed.${BWHITE}"
echo -e "${GREEN}Amass installed.${BWHITE}"
echo -e "${GREEN}OpenSSL installed.${BWHITE}"
echo -e "${GREEN}Findomain installed.${BWHITE}"

# Install HTTPRobe
echo -e "${BLUE}Installing HTTPRobe now!${BWHITE}"
wget https://github.com/tomnomnom/httprobe/releases/download/v0.2/httprobe-linux-amd64-0.2.tgz
tar xvf httprobe-linux-amd64-0.2.tgz
sudo mv httprobe /usr/bin/
rm httprobe-linux-amd64-0.2.tgz
sudo chmod +x /usr/bin/httprobe
echo -e "${GREEN}HTTPRobe installed.${BWHITE}"
sleep 2
clear
intro
echo -e "${GREEN}Cero installed.${BWHITE}"
echo -e "${GREEN}Subfinder installed.${BWHITE}"
echo -e "${GREEN}CSPRecon installed.${BWHITE}"
echo -e "${GREEN}Amass installed.${BWHITE}"
echo -e "${GREEN}OpenSSL installed.${BWHITE}"
echo -e "${GREEN}Findomain installed.${BWHITE}"
echo -e "${GREEN}AssetFinder installed.${BWHITE}"
echo -e "${GREEN}HTTPRobe installed.${BWHITE}"


#${BLUE}Installing Assetfinder
echo -e "${BLUE}Installing AssetFinder now!${BWHITE}"
wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.1/assetfinder-linux-amd64-0.1.1.tgz
mv assetfinder-linux-amd64-0.1.1.tgz assetfinder.tgz
tar -zxf assetfinder.tgz
rm assetfinder.tgz
chmod +x assetfinder
sudo mv assetfinder /usr/bin
echo -e "${GREEN}AssetFinder installed.${BWHITE}"
sleep 2
clear
intro
echo -e "${GREEN}Cero installed.${BWHITE}"
echo -e "${GREEN}Subfinder installed.${BWHITE}"
echo -e "${GREEN}CSPRecon installed.${BWHITE}"
echo -e "${GREEN}Amass installed.${BWHITE}"
echo -e "${GREEN}OpenSSL installed.${BWHITE}"
echo -e "${GREEN}Findomain installed.${BWHITE}"
echo -e "${GREEN}HTTPRobe installed.${BWHITE}"
echo -e "${GREEN}AssetFinder installed.${BWHITE}"
echo -e "${BWHITE}Setup for SubSleuth done! All the required tools have been installed. Run SubSleuth.sh now!"
