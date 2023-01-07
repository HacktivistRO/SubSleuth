#!/bin/bash

# Colour codes for output
RED='\033[0;31m' # Red colour
GREEN='\033[0;32m' # Green colour
BLUE='\033[0;34m' # Blue colour
CYAN='\033[0;36m' # Cyan colour
BIWhite='\033[1;97m' # White
BWHITE='\033[1;37m'   # Bold White colour
YELLOW='\033[0;33m' # Yellow colour

# Banner function
function intro {
echo -e "${BWHITE}  ____        _    ____  _            _   _"     
echo -e "${BWHITE} / ___| _   _| |__/ ___|| | ___ _   _| |_| |__  "
echo -e "${BWHITE} \___ \| | | | '_ \___ \| |/ _ \ | | | __| '_ \ "
echo -e "${BWHITE}   __) | |_| | |_) |__) | |  __/ |_| | |_| | | |"
echo -e "${BWHITE} |____/ \__,_|_.__/____/|_|\___|\__,_|\__|_| |_|"
echo -e "${BWHITE}			-By HacktivistRO"
echo -e ""
echo -e "${YELLOW}Performing subdomain enumeration for: $1${BWHITE}"
}

clear
intro $1
sleep 3

# Creating a folder for the target
mkdir $1
cd $1

# Running Cero
echo -e "${BLUE}Running Cero now${BWHITE}"
cero -d $1 | grep ">*.$1" | sort -u  > cero.txt
cero_total=$(cat cero.txt | wc -l)
clear
intro $1
echo -e "${GREEN}Cero done. Total sudomains found from Cero are: $cero_total"

# Running crt.sh
echo -e "${BLUE}Running crt.sh now${BWHITE}"
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF' > crtsh.txt
crtsh_total=$(cat crtsh.txt | wc -l)
echo -e "${GREEN}crt.sh done. Total sudomains found from crt.sh are: $crtsh_total"
clear
intro $1
echo -e "${GREEN}Cero done. Total sudomains found from Cero are: $cero_total"
echo -e "${GREEN}crt.sh done. Total sudomains found from crt.sh are: $crtsh_total"

# Running subfinder
echo -e "${BLUE}Running subfinder now${BWHITE}"
subfinder -d $1 -silent -recursive -all | grep ">*.$1" | sort -u > subfinder.txt
subfinder_total=$(cat subfinder.txt | wc -l)
echo -e "${GREEN}Subfinder done. Total sudomains found from SubFinder are: $subfinder_total"
clear
intro $1
echo -e "${GREEN}Cero done. Total sudomains found from Cero are: $cero_total"
echo -e "${GREEN}crt.sh done. Total sudomains found from crt.sh are: $crtsh_total"
echo -e "${GREEN}Subfinder done. Total sudomains found from SubFinder are: $subfinder_total"

# Running CSPRecon
echo -e "${BLUE}Running CSPRecon now${BWHITE}"
csprecon -u https://$1 -s | grep ">*.$1" | sort -u > csprecon.txt
csprecon_total=$(cat csprecon.txt | wc -l)
echo -e "${GREEN}CSPRecon done. Total sudomains found from CSPRecon are: $csprecon_total"
clear
intro $1
echo -e "${GREEN}Cero done. Total sudomains found from Cero are: $cero_total"
echo -e "${GREEN}crt.sh done. Total sudomains found from crt.sh are: $crtsh_total"
echo -e "${GREEN}Subfinder done. Total sudomains found from SubFinder are: $subfinder_total"
echo -e "${GREEN}CSPRecon done. Total sudomains found from CSPRecon are: $csprecon_total"

# Running Amass
echo -e "${BLUE}Running Amass now${BWHITE}"
amass enum -d $1 -active -passive -o amass.txt
amass_total=$(cat amass.txt | wc -l)
echo -e "${GREEN}Amass done. Total sudomains found from Amass are: $amass_total"
clear
intro $1
echo -e "${GREEN}Cero done. Total sudomains found from Cero are: $cero_total"
echo -e "${GREEN}crt.sh done. Total sudomains found from crt.sh are: $crtsh_total"
echo -e "${GREEN}Subfinder done. Total sudomains found from SubFinder are: $subfinder_total"
echo -e "${GREEN}CSPRecon done. Total sudomains found from CSPRecon are: $csprecon_total"
echo -e "${GREEN}Amass done. Total sudomains found from Amass are: $amass_total"

# Running OpenSSL
echo -e "${BLUE}enumerating subdomains using OpenSSL now"
true | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -noout -text  | perl -l -0777 -ne '@names=/\bDNS:([^\s,]+)/g; print join("\n", sort @names);' > openssl.txt
openssl_total=$(cat openssl.txt | wc -l)
echo -e "${GREEN}OpenSSL done. Total sudomains found from OpenSSL are: $openssl_total"
clear
intro $1
echo -e "${GREEN}Cero done. Total sudomains found from Cero are: $cero_total"
echo -e "${GREEN}crt.sh done. Total sudomains found from crt.sh are: $crtsh_total"
echo -e "${GREEN}Subfinder done. Total sudomains found from SubFinder are: $subfinder_total"
echo -e "${GREEN}CSPRecon done. Total sudomains found from CSPRecon are: $csprecon_total"
echo -e "${GREEN}Amass done. Total sudomains found from Amass are: $amass_total"
echo -e "${GREEN}OpenSSL done. Total sudomains found from OpenSSL are: $openssl_total"

# Running Findomain
echo -e "${BLUE}Running Findomain now${BWHITE}" 
findomain -t $1 -u findomain.txt
findomain_total=$(cat findomain.txt | wc -l)
echo -e "${GREEN}Findomain done. Total sudomains found from Findomain are: $findomain_total"
clear
intro $1
echo -e "${GREEN}Cero done. Total sudomains found from Cero are: $cero_total"
echo -e "${GREEN}crt.sh done. Total sudomains found from crt.sh are: $crtsh_total"
echo -e "${GREEN}Subfinder done. Total sudomains found from SubFinder are: $subfinder_total"
echo -e "${GREEN}CSPRecon done. Total sudomains found from CSPRecon are: $csprecon_total"
echo -e "${GREEN}Amass done. Total sudomains found from Amass are: $amass_total"
echo -e "${GREEN}OpenSSL done. Total sudomains found from OpenSSL are: $openssl_total"
echo -e "${GREEN}Findomain done. Total sudomains found from Findomain are: $findomain_total"

# Running Assetfinder
echo -e "${BLUE}Running AssetFinder now${BWHITE}" 
assetfinder --subs-only $1 > assetfinder.txt
sed "s/\*//g" assetfinder.txt
assetfinder_total=$(cat assetfinder.txt | wc -l)
echo -e "${GREEN}AssetFinder done. Total sudomains found from Assetfinder are: $assetfinder_total"
clear
intro $1

# Subdomain enumeration completed. Removing duplicate subdomains
echo -e "${GREEN}Cero done. Total sudomains found from Cero are: $cero_total"
echo -e "${GREEN}crt.sh done. Total sudomains found from crt.sh are: $crtsh_total"
echo -e "${GREEN}Subfinder done. Total sudomains found from SubFinder are: $subfinder_total"
echo -e "${GREEN}CSPRecon done. Total sudomains found from CSPRecon are: $csprecon_total"
echo -e "${GREEN}Amass done. Total sudomains found from Amass are: $amass_total"
echo -e "${GREEN}OpenSSL done. Total sudomains found from OpenSSL are: $openssl_total"
echo -e "${GREEN}Findomain done. Total sudomains found from Findomain are: $findomain_total"
echo -e "${GREEN}AssetFinder done. Total sudomains found from Assetfinder are: $assetfinder_total"
echo -e "${CYAN}Subdomain enumeration from all the above tools done!"
echo -e "${BWHITE}Removing duplicate subdomains now"
cat cero.txt crtsh.txt subfinder.txt csprecon.txt amass.txt openssl.txt findomain.txt assetfinder.txt | grep ">*.$1" | sort -u > subdomains.txt
sleep 3
clear
intro $1
total_sub=$(cat subdomains.txt | wc -l)
echo "Unique sudomains found from all the resources are: $total_sub. But it might contain dead subdomains"

# Removing dead subdomains using HTTPRobe 
echo -e "${BLUE}Removing dead subdomains now"
cat subdomains.txt | httprobe > subdomains_$1.txt

# Removing temporary files
echo "Dead subdomains filtered. Clearing temporary files now."
rm cero.txt
rm crtsh.txt
rm subfinder.txt
rm csprecon.txt
rm amass.txt
rm openssl.txt
rm findomain.txt
rm assetfinder.txt
rm domain.txt
rm subdomains.txt 
clear
intro $1

# Printing gathered subdomains now
echo "Live subdomains stored in subdomains_$1.txt file for $1"
uniq_sub_total=$(cat subdomains_$1.txt | wc -l)
echo "Total sudomains found: $uniq_sub_total"
echo "Subdomains for $1 are:"
cat subdomains_$1.txt
