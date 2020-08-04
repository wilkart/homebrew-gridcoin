# Gridcoin Research CLI for macOS

## Disclaimer
This software is recognised as an OSX/CoinMiner by antivirus. 
Disable any real time system protection for installation time.


## Installation

    brew tap wilkart/gridcoin
    brew install gridcoin-cli


## Configuration
~/Library/ApplicationSupport/GridcoinResearch/

    daemon=1
    listen=1
    port=32749

    addnode=fi.gridcoin.pl
    addnode=is.gridcoin.pl
    addnode=nl.gridcoin.pl
    addnode=fr.gridcoin.pl
    addnode=pl.gridcoin.pl
    addnode=by.gridcoin.pl
    addnode=ch.gridcoin.pl

    server=1
    rpcuser=<YOUR USER>
    rpcpassword=<YOUR PASSWORD>
    rpcssl=1
    
    email=<YOUR BOINC EMAIL>
    boincdatadir=/Library/Application Support/BOINC Data/


## Running
    /usr/local/Cellar/gridcoin-cli/4.0.6.0/bin/gridcoinresearchd


## Help
    /usr/local/Cellar/gridcoin-cli/4.0.6.0/bin/gridcoinresearchd help


## Unistallation

    brew uninstall gridcoin-cli
    brew untap wilkart/gridcoin
