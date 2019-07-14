#!/bin/bash

#-------- EDIT THE SECTION BETWEEN THE PARENTHESIS ONLY - DO NOT REMOVE ANYTHING ELSE ------ #
# 
# EXAMPLE: email_address="your@emailaddr.ess" <--- Be careful to not delete a " or the trailing &&
# 
# NOW EDIT SECTION BELOW


email_address="YOUR_EMAIL_ADDRESS_HERE" &&



#
#
#
#
#--------THE END DO NOT EDIT ANYTHING ELSE ------


#-------- TARGET BLOCKCHAIN PARAMS ------ #
# 
# Which blockchain are you connecting to? Uncomment (remove the # in front of the text) the applicable one
# 
target_chain="FraxTest" &&                 #<----- IF UNCOMMENTED CONNECTING TO THE DREAMBLOCK TEST CHAIN

# target_chain="db_livechain" &&            #<----- IF UNCOMMENTED CONNECTING TO THE DREAMBLOCK LIVE CHAIN
#
echo "::~~~~~~~~~UPDATING SERVER SOFTWARE~~~~~~~~~~~::" &&	

#sudo apt-get update &&

echo "" &&

servername=$(sudo hostname) &&

echo "::~~~~~~~~~~~INSTALLING JQ~~~~~~~~~~~~::" &&

sudo apt install -y jq && 

echo "::~~~~~~~~~~~INSTALLING GIT~~~~~~~~~~~~::" &&

sudo apt install git &&

curl -L https://www.opscode.com/chef/install.sh | sudo bash &&

echo "" &&

echo "::~~~~~~~~~~CLONING NODE LIB~~~~~~~~~~~::" &&

git clone https://github.com/Fraxeum/MiningNode.git && # Mining node

echo "::~~~~~~~~~~~~INSTALL NODE~~~~~~~~~~~~~::" &&

cd MiningNode/fraxeum-node-v01/node-linux &&

sudo sh install_node &&

cd /apps &&

sudo ./start_node &&

echo "::~~~~~~~~~~~~CONFIGURING SERVICE~~~~~~~~~~~~~::" &&

./multichain-cli -datadir="./datadir" $target_chain getruntimeparams | jq '.handshakelocal' > nodeaddress.tmp &&

node_address=$(<nodeaddress.tmp) &&

rm nodeaddress.tmp &&

ip_address=$(curl -s https://api.ipify.org) &&

echo "::~~~~~~~~~~ACTIVATING NODE~~~~~~~~~~~::" &&

httpString="c=addminer&token=14DCeawRF6gg761SCespoig30bE&email=$email_address&address=${node_address:1:-1}&ip=$ip_address&description=$servername" && 

echo "REQUEST STRING: $httpString" &&

#------------------------------ SECTION 3: TARGET BLOCKCHAIN PARAMS ----------------------------------- #
# 
# Which blockchain are you connecting to? Uncomment (remove the # in front of the text) the applicable one. 
# REMEMBER to comment the other.
# 
response=$(curl -d $httpString https://api.fraxeum.org/demov1) &&        # UNCOMMENT FOR TESTNET
 #response=$(curl -d $httpString https://api.fraxeum.org/v1) &&          # UNCOMMENT FOR MAINNET
#
#
#
##-------------------------------------------------------------------------------------------------------#



echo $response >> miner_activation_report.dat &&

echo "::   ~~~~~~~~  SETTING UP NODE MONITORING AND RESTART    ~~~~~~~~~   ::" &&

(crontab -l 2>/dev/null; echo "@reboot cd /apps && ./start_node") | crontab - 
