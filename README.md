![Fraxeum-Logo](https://fraxeum.org/assets/img/logo-400x120-colour.png)


# FRAXEUM MINER INSTALL GUIDE
## Introduction
Fraxeum implements a permissioned blockchain forked from the [Multichain] (https://multichain.com) core source code. 

### Essential reading
Before continuing, please read the Fraxeum Whitepaper, with special focus on the following sections:
1. The Fraxeum Blockchain: Pages 11 to 18
2. Coin types: Pages 25 to 27
3. [Fraxeum whitepaper] (https://fraxeum.org/whitepaper/Fraxeum_Whitepaper.pdf)
4. [Fraxeum Node Install Doc] (https://fraxeum.org/nodes/Fraxeum_Node_Installation_Guide.pdf)

## Mining requirements
### Minimum system requirement
Note: Both Admin and Miner nodes run the same software.

#### Operating System 
- Linux 64-bit (Install script provided): Supports Ubuntu 12.04+, CentOS 6.2+, Debian 7+, Fedora 15+, RHEL 6.2+. 
- Windows 64-bit (Install script pending): Supports Windows 7, 8, 10, Server 2008 or later. 
- Mac 64-bit (Install script pending): Supports OS X 10.11 or later

#### Hardware
- RAM: 1 GB
- Storage: 2 GB (Will increase with time)
- IP Addresses: 1x Dedicated

#### Indicative Mining Cost
+/- USD20 per month - depending on server configuration. The minimum server requirement is offered by Vultr.com for $10 per month.

NOTE: Detail like how miners are rewarded, how miner rewards are claimed etc are available in the Fraxeum whitepaper, here: https://fraxeum.org/whitepaper/Fraxeum_Whitepaper.pdf

## Miner installation guide
### The Linux Auto Install Shell Script
Note: Currently only available for _Linux OS_ flavours. Feel free to contribute more auto install scripts for rewards :-)

- The auto install shell script will attempt to run a basic server upgrade to ensure that the latest software and security updates are installed. It will then download the latest version of the Multichain blockchain from the Fraxeum Git repository, install it and configure it on the server. The script will attempt to start and activate the node. Upon successful activation, the system will register a function with the server that will restart the node automatically after a server reboot.
- An install log is kept in /tmp/firstboot.log NOTE: This directory is deleted at second server boot.
- An app directory will be created (if not errors are encountered): /apps
- A node activation log will be created: /apps/miner_activation_log.dat

#### Step 1: User identity verification
What you need:
1. Mobile phone
2. Telegram app

_What you do:_
- Open the following link from your mobile phone: https://mine.fraxeum.org
- Complete the Telegram basic user verification process. 

#### Step 2: Install your first node
_FOR NON-LINUX ADMINS:_ 
Find step by step directions here [Fraxeum Node Install Doc](https://fraxeum.org/nodes/Fraxeum_Node_Installation_Guide.pdf)

_FOR LINUX ADMIN:_
- A Linux VM(or server) that matches or exceeds the minimum system requirements - specified above. 

- The Fraxeum Linux startup script located here (or follow link from Fraxeum.org website): 
https://raw.githubusercontent.com/Fraxeum/MiningNode/master/fraxeum-node-v01/node-linux/linux_startup_script.sh
The same email address you used when you verified your identity.

## Join the community and contribute
Please join the Fraxeum Telegram community @Fraxeum - Let us know how you can contribute and if it isn't already being done by others we'll negotiate a Fraxeum Coin based reward with you.




