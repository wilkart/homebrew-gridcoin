# Gridcoin Research CLI for macOS


## Disclaimer
This software is identified as OSX/CoinMiner by antimalware and antivirus software. 
To proceed with installation or upgrade, you will need to temporarily disable these security tools. 
Additionally, please ensure to exclude or ignore the following path from real-time protection in order to run the wallet.

    /opt/homebrew/Cellar/gridcoin-cli (Apple Silicon)

    /usr/local/Cellar/gridcoin-cli (Apple Intel)

Apple Lockdown Mode helps protect devices against extremely rare and highly sophisticated cyber attacks. It prevents Gridcoin Research CLI for macOS to work correctly ("staking": false, "mining-error": "Offline",). Disable Lockdown Mode, reboot your system, proceed with installation or upgrade and enable Lockdown Mode on again.


## Installation

    brew tap wilkart/gridcoin
    brew install gridcoin-cli


## Configuration
~/Library/ApplicationSupport/GridcoinResearch/gridcoinresearch.conf

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
    brew services start wilkart/gridcoin/gridcoin-cli


## Usage
#### Read manual and help pages.
    man 1 gridcoinresearchd
    gridcoinresearchd --help
    gridcoinresearchd help

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


## Unistallation

    brew uninstall gridcoin-cli
    brew untap wilkart/gridcoin
