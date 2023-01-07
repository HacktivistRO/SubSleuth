# Namaste! 🙏

![Logo](https://raw.githubusercontent.com/HacktivistRO/SubSleuth/main/static/subsleuth_logo.jpg)

## About: **SubSleuth**: A Passive Subdomain Enumeration.

SubSleuth is a bash script that automates the process of enumerating subdomains using the following tools:

* Cero
* crt.sh
* Subfinder
* CSPRecon
* Amass
* OpenSSL
* Findomain
* AssetFinder

It also filters out duplicate subdomains and checks for dead subdomains using httprobe.

## Setting up SubSleuth

First, clone this repository, using:

`git clone https://github.com/HacktivistRO/SubSleuth`

Second, go into SubSleuth directory, using:

`cd SubSleuth`

To install the required tools, run the setup.sh script, using:
`bash setup.sh`

Now your machine is ready to run: SubSleuth!

## Usage

To run SubSleuth, use the following command:

`bash subsleuth.sh <rohan-target-website-here.com>`

Replace <rohan-target-website-here.com> with the target domain. The script will output a list of subdomains to a file named subdomains_rohan-target-website-here.com.txt inside a folder rohan-target-website-here.com

# Notes
The setup.sh script will install the required tools to the current directory. Make sure you have the necessary permissions.

The enumeration process may take a while to complete. Be patient.

# Credits

All the authors of the respective tools.

<p align="center">
Happy Hacking!❤️
</p> 
