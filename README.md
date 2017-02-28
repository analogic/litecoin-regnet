Simple litecoin network with pre-generated litecoins
==================================================

**How to use container?**

1. **docker run --name regnet analogic/litecoin-regnet** [-p 18332:18332] [-v /data:/data]
2. ...wait couple seconds...
3. 
  - connect to XML-RPC port 18332 with username "**litecoinrpc**" and password "**rpcpassword**", now you have access to full featured network with pregenerated and confirmed litecoins at "**myaccount**" account
  - you can also work with command line like "**docker exec regnet litecoin-cli listaccounts**"
4. profit!

**docker exec regnet litecoin-cli -conf=/etc/conf/node-2/litecoin.conf listaccounts** for second litecoind node
block is mined every minute
