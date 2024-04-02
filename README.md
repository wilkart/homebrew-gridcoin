# Gridcoin Research CLI for macOS


## Disclaimer
This software is recognised as an OSX/CoinMiner by antimalware and antivirus tools. 
You have to temporarily disable that tools for an installation or upgrade. 
Also exclude or ignore the following path from a real time protection to run the wallet:
    
    /opt/homebrew/Cellar/gridcoin-cli (Apple Silicon)

    /usr/local/Cellar/gridcoin-cli (Apple Intel)

Apple Lockdown Mode helps protect devices against extremely rare and highly sophisticated cyber attacks. It prevents Gridcoin Research CLI for macOS to work correctly ("staking": false, "mining-error": "Offline",). Disable Lockdown Mode, reboot your system, proceed with installation or upgrade and enable Lockdown Mode on again.

## Installation

    brew tap wilkart/gridcoin
    brew install gridcoin-cli

## Configuration
~/Library/ApplicationSupport/GridcoinResearch/gridcoinresearch.conf

    daemon=1
    listen=1
    port=32749

    addnode=seed.gridcoin.pl

    server=1
    rpcuser=<YOUR USER>
    rpcpassword=<YOUR PASSWORD>
    rpcssl=0

    email=<YOUR BOINC EMAIL>
    boincdatadir=/Library/Application Support/BOINC Data/


## Running
    gridcoinresearchd -daemon

## Usage

#### List balances by receiving address.
    gridcoinresearchd listreceivedbyaddress 1 true true

#### Total available balance.
    gridcoinresearchd getbalance

#### Display network related information.
    gridcoinresearchd getnetworkinfo

#### Display mining-related information.
    gridcoinresearchd getstakinginfo

#### Display status of your beacon.
    gridcoinresearchd beaconstatus


## Help
    gridcoinresearchd --help
    gridcoinresearchd help


## Unistallation

    brew uninstall gridcoin-cli
    brew untap wilkart/gridcoin
