# Namaste! 🙏

![Logo](https://raw.githubusercontent.com/HacktivistRO/SubSleuth/main/static/subsleuth_logo.jpg)

## About **SubSleuth**: A Passive Subdomain Enumeration.

### SubSleuth, is a bash tool which automates the subdomain enumeration process using various tools.

With SubSleuth, you can effortlessly track down all the hidden subdomains of a target domain, saving you time and effort. And with its ability to filter out duplicates and check for dead subdomains, you can be sure that your enumeration results are as comprehensive and accurate as possible So why wait? Give SubSleuth a try today and supercharge your subdomain enumeration process! 

SubSleuth automates the subdomain enumeration process using the following tools:

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

## Special instructions for Mac users

You will require wget and curl to run setup.sh.

Run the following command to install Homebrew on Mac:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Once Homebrew is installed, run the following command to install wget on Mac:

`brew install wget`

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
