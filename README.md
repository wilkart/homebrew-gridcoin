# Gridcoin Research CLI for macOS


## Disclaimer
This software is identified as OSX/CoinMiner or Unsigned.CryptoWallet by antimalware and antivirus software. 
To proceed with installation or upgrade, you will need to temporarily disable these security tools. 
Additionally ensure to exclude or ignore the following path from real-time protection in order to run the wallet.

    /opt/homebrew/Cellar/gridcoin-cli (Apple Silicon)

    /usr/local/Cellar/gridcoin-cli (Apple Intel)

Apple Lockdown Mode helps protect devices against extremely rare and highly sophisticated cyber attacks. It might prevent Gridcoin Research CLI for macOS to work correctly ("staking": false, "mining-error": "Offline",). Disable Lockdown Mode, reboot your system, proceed with installation or upgrade and enable Lockdown Mode again.


## Installation

    brew tap wilkart/gridcoin;
    brew install gridcoin-cli; ## from compiled binary
    brew install --build-from-source gridcoin-cli; ## or from source code


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
    brew services start wilkart/gridcoin/gridcoin-cli;
    tail -f ~/Library/Application\ Support/GridcoinResearch/debug.log;


## Usage
#### Read manual and help pages.
    man 1 gridcoinresearchd;
    gridcoinresearchd --help;
    gridcoinresearchd help;

#### List balances by receiving address.
    gridcoinresearchd listreceivedbyaddress 1 true true;

#### Total available balance.
    gridcoinresearchd getbalance;

#### Display network related information.
    gridcoinresearchd getnetworkinfo;

#### Display mining-related information.
    gridcoinresearchd getstakinginfo;

#### Display status of your beacon.
    gridcoinresearchd beaconstatus;


## Upgrade
    brew services stop wilkart/gridcoin/gridcoin-cli;
    brew update;
    brew upgrade gridcoin-cli; ## from compiled binary
    brew upgrade --build-from-source gridcoin-cli; ## or from source code
    brew services start wilkart/gridcoin/gridcoin-cli;


## Unistallation

    brew uninstall gridcoin-cli;
    brew untap wilkart/gridcoin;

## Feedback
Feedback is appreciated.

    https://github.com/wilkart/homebrew-gridcoin/issues
    https://github.com/wilkart/homebrew-gridcoin/discussions

Gridcoin Research CLI for macOS is exclusively tested on Apple M1 Max. Send GRC to support it.

    GRC: RyaMjQmvWbpey3xxuQnrVNUqJWphLqQxqt

Brew bottles and blockchain snapshots are stored on decentralized cloud storage platform.
Send ERC20 STORJ tokens via Ethereum (L1) network or zkSync Era (L2) network to support it.

    STORJ: 0x22Ec31C57e88cD1561701f1f5e49FbF5f9B0E861
