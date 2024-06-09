#!/bin/bash

Errors=()

declare -A dotfiles

dotfiles[nmap]="Network Mapper"
dotfiles[john]="Find weak pwd"
dotfiles[hashcat]="Password Cracking"
dotfiles[hydra]="Login Cracker"
dotfiles[spiderfoot]="OSINT automation tool"
dotfiles[sqlmap]="SQL injection automation."
dotfiles[dirb]="Web Content Scanner"
dotfiles[gobuster]="Fuzzy find URI, DNS sub, VH names, S3 bckts."
dotfiles[amass]="Network mapping of attack surfaces and asset discovery."
dotfiles[theharvester]="Gathering subdoimns, email, open ports, banners, etc."
dotfiles[amass]="Network mapping of attack surfaces and asset discovery."
dotfiles[nikto]="Webserver and CGI scanner"
dotfiles[netcat-traditional]="TCP/UDP connectivity."
dotfiles[ffuf]="Fasw web fuzzer for discovery of: directories, virtual host and GET/POs param fuzzing"
dotfiles[lynis]="Hardening GNU/Linux systems"
dotfiles[yersinia]="Framework for performing layer 2 attacks"
dotfiles[veil]="Generate msf payloads to bypass common anti-virus solutions."
dotfiles[whatweb]="Identifies websites. Website fingerprinting."
dotfiles[dnsniff]="Tools to listen to and create network traffic."
dotfiles[lbd]="Checks if a given domain uses load-balancing."
dotfiles[subfinder]="Subdomain discovery tool that discovers valid subdomains for websites by using passive online sources."
dotfiles[goldeneye]="HTTP DoS Test Tool."
dotfiles[wfuzz]="Bruteforcing Web Applications."
dotfiles[dmitry]="Find subdomains, email addresses, uptime info, port scan, whois lookup, etc."
dotfiles[fierce]="DNS scanner precursor to nmap."
dotfiles[metasploit-framework]="The Metasploit Framework"

function isInstalled() {
    package=$1
    dpkg-query -s $package &>/dev/null
    if [[ $?  -eq 0 ]];then
        return 0	
    else
        return 1
    fi
}

function aptif() {
    package=$1
    echo -e "\e[36m[LOG]: Installing \e[33m$package\e[37m\e[36m --> ${dotfiles[$package]}\e[0m"
    isInstalled $package
    if [[ $? -eq 0 ]];then 
	echo -e "[\e[1;32mSUCCESS]: \e[4m$package\e[0m\e[1;32m already installed\e[0m"
    else 
	sudo apt-get install -qq -y --no-show-upgraded --no-upgrade $package 1>/dev/null
	if [[ $? -eq 0 ]];then
	    echo -e "[\e[1;32mSUCCESS]: Installing $package --> \e[1;32m${dotfiles[$package]}\e[0m"
	else 
	    echo -e "[\e[1;31mERROR\e[0m]: An error occurred installing \e[1;31m$package\e[0m"
	    Errors+=("$package")
	fi
    fi
}

for el in "${!dotfiles[@]}"; do
    aptif $el
done

if [[ "${#Errors[@]}" -eq 0 ]]; then
    echo -e "\n[\e[1;32mSUCCESS\e[0m]: All packages have been successfully installed.\e[0m"
else
    echo -e "\n\e[1;36m[LOG]: Errors occurred during installation of the following packages -->\e[0m]"
    for err in "${Errors[@]}"; do
        echo -e "\tUnable to install \e[1;31m$err\e[0m used as ${dotfiles[$err]}"
    done
fi
