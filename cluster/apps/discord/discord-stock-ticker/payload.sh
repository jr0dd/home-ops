#!/usr/bin/env bash

set -o nounset
set -o errexit

curl -X POST \
"localhost:8080/tickerboard" \
-H "Content-Type: application/json" \
-d "{\"name\":\"INDICES\", \
    \"discord_bot_token\":\"$INDICES\", \
    \"items\": [\"SPY\", \"^VIX\", \"IWM\", \"^NDX\"], \
    \"frequency\":5, \
    \"percentage\": true, \
    \"nickname\":false, \
    \"arrows\":true, \
    \"color\":false}"

curl -X POST \
"localhost:8080/tickerboard" \
-H "Content-Type: application/json" \
-d "{\"name\":\"FUTURES\", \
    \"discord_bot_token\":\"$FUTURES\", \
    \"items\": [\"ES=F\", \"RTY=F\", \"NQ=F\", \"YM=F\"], \
    \"frequency\":5, \
    \"percentage\": true, \
    \"nickname\":false, \
    \"arrows\":true, \
    \"color\":false}"

curl -X POST \
"localhost:8080/tickerboard" \
-H "Content-Type: application/json" \
-d "{\"name\":\"MEMES\", \
    \"discord_bot_token\":\"$MEMES\", \
    \"items\": [\"PLTR\", \"MVIS\", \"TLRY\", \"BB\", \"GME\", \"AMC\", \"WISH\", \"CLNE\", \"NOK\", \"RKT\", \"BBBY\", \"KOSS\", \"CLOV\", \"SPCE\"], \
    \"frequency\":5, \
    \"percentage\": true, \
    \"nickname\":false, \
    \"arrows\":true, \
    \"color\":false}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"AAPL\", \
    \"name\":\"AAPL\", \
    \"discord_bot_token\":\"$AAPL\", \
    \"frequency\":5, \
    \"nickname\":true, \
    \"arrows\":true, \
    \"color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"TSLA\", \
    \"name\":\"TSLA\", \
    \"discord_bot_token\":\"$TSLA\", \
    \"frequency\":5, \
    \"nickname\":true, \
    \"arrows\":true, \
    \"color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"BTC\", \
    \"name\":\"bitcoin\", \
    \"discord_bot_token\":\"$BTC\", \
    \"crypto\":true, \
    \"frequency\":5, \
    \"nickname\":true, \
    \"arrows\":true, \
    \"color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"ETH\", \
    \"name\":\"ethereum\", \
    \"discord_bot_token\":\"$ETH\", \
    \"crypto\":true, \
    \"frequency\":5, \
    \"nickname\":true, \
    \"arrows\":true, \
    \"color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"DOGE\", \
    \"name\":\"dogecoin\", \
    \"discord_bot_token\":\"$DOGE\", \
    \"crypto\":true, \
    \"frequency\":5, \
    \"decimals\": 6, \
    \"nickname\":true, \
    \"arrows\":true, \
    \"color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"SHIB\", \
    \"name\":\"shiba-inu\", \
    \"discord_bot_token\":\"$SHIB\", \
    \"crypto\":true, \
    \"frequency\":5, \
    \"decimals\": 8, \
    \"nickname\":true, \
    \"arrows\":true, \
    \"color\":true}"
