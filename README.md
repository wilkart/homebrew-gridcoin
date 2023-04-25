# Gridcoin Research CLI for macOS


## Disclaimer
This software might be recognised as an OSX/CoinMiner by antimalware and antivirus tools. 
Consider to temporarily disable it for an installation time. Exclude or ignore the following path from a real time protection to run the wallet:
    
    /usr/local/Cellar/gridcoin-cli

    /opt/homebrew/Cellar/gridcoin-cli

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
