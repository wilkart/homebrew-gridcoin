# Gridcoin Research CLI for macOS

## Disclaimer
This software is recognised as an OSX/CoinMiner by antivirus. Disable any real time system protection for installation time. Exclude the following path from future antivirus scanning.
    
    /usr/local/Cellar/gridcoin-cli-db5
    /usr/local/Cellar/gridcoin-cli-db4

## Installation with BerkleyDB 5.x

    brew tap wilkart/gridcoin
    brew install gridcoin-cli-db5

## Alternative installation compatible with BerkleyDB 4.x

    brew tap wilkart/gridcoin
    brew install gridcoin-cli-db4


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
    /usr/local/bin/gridcoinresearchd -daemon

## Usage

#### List balances by receiving address.
    /usr/local/bin/gridcoinresearchd listreceivedbyaddress 1 true true

#### Total available balance.
    /usr/local/bin/gridcoinresearchd getbalance

#### Display network related information.
    /usr/local/bin/gridcoinresearchd getnetworkinfo

#### Display mining-related information.
    /usr/local/bin/gridcoinresearchd getmininginfo

#### Display status of your beacon.
    /usr/local/bin/gridcoinresearchd beaconstatus


## Help
    /usr/local/bin/gridcoinresearchd --help
    /usr/local/bin/gridcoinresearchd help


## Unistallation

    brew uninstall gridcoin-cli
    brew untap wilkart/gridcoin
