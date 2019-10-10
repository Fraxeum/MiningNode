#!/bin/bash

#--------UBUNTU 19.04, 18.10, 18.04, 16.04 COMPATIBLE------#

#This script works with a standard, out of the box installation of Ubuntu 18.04 and 16.04. 


#---------------------------------------------------------#

#--------INSTRUCTIONS ------#
# 1. Fraxeum is a permissioned blockchain. You must verify your identity with Telegram before you start this process.
# 2. Add your email address to the email_address variable in Section 1. This email_address MUST match the email_address you verified using Telegram.
# 3. If you are installing a node on the TESTNET you don't need to change anything else.
# 4. If you are installing a node on the MAINNET you need to edit Section 2 and Section 3.
# 5. BEFORE YOU CAN INSTALL A MINING SERVER - YOU START DO THE FOLLOWING:
#    a) Join Fraxeum's Telegram Group: https://t.me/fraxeum
#    b) Complete the Telegram KYC process: https://mine.fraxeum.org
#    c) Use the email address that you used in (b) above for this purpose.
# 6. Please report issues to info [a.t] fraxeum.org
# 7. Feel free to improve improve this script - any work done is rewarded in Fraxeum Coin.
#--------------------------#


#-------- SECTION 1 -------#
# 
# EXAMPLE: email_address="your@emailaddr.ess" <--- Be careful to not delete a " or the trailing &&
# 

email_address="YOUR_EMAIL_ADDRESS_GOES_HERE" &&

#
#---------------------------#


#-------- SECTION 2 -------#
# 
# 
target_chain="Fraxeum" &&           #<----- CONNECTING TO THE FRAXEUM MAINNET
#
#--------------------------#


#--------------------------------  DO NOT EDIT THIS SECTION -----------------------------------#

sudo sleep 30 &&

#echo "::~~~~~~~~~~~INSTALLING JQ~~~~~~~~~~~~::" &&

sudo apt-get install -y jq && 

#echo "::~~~~~~~~~~~INSTALLING CURL ~~~~~~~~~~~~::" &&

sudo apt-get install --assume-yes curl  &&

#echo "::~~~~~~~~~~~INSTALLING GIT~~~~~~~~~~~~::" &&

sudo apt-get install git &&

#echo "::~~~~~~~STARTING NODE INSTALL~~~~~~~~::" &&

servername=$(sudo hostname) &&

curl -L https://www.opscode.com/chef/install.sh | sudo bash &&

#echo "::~~~~~~~~~~CLONING NODE LIB~~~~~~~~~~~::" &&

git clone https://github.com/Fraxeum/MiningNode.git && # Mining node

#echo "::~~~~~~~~~~~~INSTALL NODE~~~~~~~~~~~~~::" &&

cd MiningNode/fraxeum-node-v01/node-linux &&

sudo sh install_node &&

cd /apps &&

#echo "::~~~~~~~~~~~~CONFIGURING SERVICE~~~~~~~~~~~~~::" &&

sudo ./start_node > nodeaddress.tmp &&

node_address=$(grep "grant" nodeaddress.tmp | head -1 | cut -d " " -f 4) &&

ip_address=$(curl -s https://api.ipify.org) &&

httpString="c=addminer&token=&email=$email_address&address=$node_address&ip=$ip_address&description=$servername" && 

echo $httpString >> miner_activation_report.dat &&

#---------------------------------------------------------------------------------------------#




#-------- SECTION 3 -------#
# 
# Which blockchain are you connecting to? Uncomment (remove the # in front of the text) the applicable one. 
# REMEMBER to comment the other.
# 
# response=$(curl -d $httpString #https://gw.fraxeum.org/demov1) &&        # UNCOMMENT FOR TESTNET
response=$(curl -d $httpString https://gw.fraxeum.org/v1) &&     # UNCOMMENT FOR MAINNET
#
#
##-------------------------#



#--------------------------------  DO NOT EDIT THIS SECTION -----------------------------------#

echo $response >> miner_activation_report.dat &&

#echo "::~~~~~~~~~SETTING UP NODE MONITORING~~~~~~~~~~::" &&

(crontab -l 2>/dev/null; echo "@reboot cd /apps && ./start_node") | crontab - && 

#echo "::~~~~~~~~~UPGRADING SERVER SOFTWARE~~~~~~~~~~~::" &&	

sudo apt -y update &&

sudo apt-get -y upgrade && 

#echo "*********WARNING********* " &&

#echo "Rebooting in 30 seconds. Press CTRL-C to abort." &&

sudo sleep 30 &&

sudo reboot
