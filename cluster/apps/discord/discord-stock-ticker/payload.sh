#!/usr/bin/env bash

set -o nounset
set -o errexit

curl -X POST \
"localhost:8080/tickerboard" \
-H "Content-Type: application/json" \
-d "{\"name\":\"INDICES\", \
    \"discord_bot_token\":\"$INDICES\", \
    \"twelve_data_key\": \"$TWELVEDATA_API\",
    \"items\": [\"SPY\", \"^VIX\", \"IWM\", \"^NDX\"], \
    \"frequency\":15, \
    \"percentage\": true, \
    \"set_nickname\":false, \
    \"arrows\":true, \
    \"set_color\":true}"

curl -X POST \
"localhost:8080/tickerboard" \
-H "Content-Type: application/json" \
-d "{\"name\":\"FUTURES\", \
    \"discord_bot_token\":\"$FUTURES\", \
    \"twelve_data_key\": \"$TWELVEDATA_API\",
    \"items\": [\"ES=F\", \"RTY=F\", \"NQ=F\", \"YM=F\"], \
    \"frequency\":15, \
    \"percentage\": true, \
    \"set_nickname\":false, \
    \"arrows\":true, \
    \"set_color\":true}"

curl -X POST \
"localhost:8080/tickerboard" \
-H "Content-Type: application/json" \
-d "{\"name\":\"MEMES\", \
    \"discord_bot_token\":\"$MEMES\", \
    \"twelve_data_key\": \"$TWELVEDATA_API\",
    \"items\": [\"PLTR\", \"MVIS\", \"TLRY\", \"BB\", \"GME\", \"AMC\", \"WISH\", \"CLNE\", \"NOK\", \"RKT\", \"BBBY\", \"KOSS\", \"CLOV\", \"SPCE\"], \
    \"frequency\":15, \
    \"percentage\": true, \
    \"set_nickname\":false, \
    \"arrows\":true, \
    \"set_color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"BTC\", \
    \"name\":\"bitcoin\", \
    \"discord_bot_token\":\"$BTC\", \
    \"crypto\":true, \
    \"frequency\":5, \
    \"set_nickname\":true, \
    \"arrows\":true, \
    \"set_color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"DOGE\", \
    \"name\":\"dogecoin\", \
    \"discord_bot_token\":\"$DOGE\", \
    \"crypto\":true, \
    \"frequency\":5, \
    \"set_nickname\":true, \
    \"arrows\":true, \
    \"set_color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"ETH\", \
    \"name\":\"ethereum\", \
    \"discord_bot_token\":\"$ETH\", \
    \"crypto\":true, \
    \"frequency\":5, \
    \"set_nickname\":true, \
    \"arrows\":true, \
    \"set_color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"SHIB\", \
    \"name\":\"shiba-inu\", \
    \"discord_bot_token\":\"$SHIB\", \
    \"crypto\":true, \
    \"frequency\":5, \
    \"set_nickname\":true, \
    \"arrows\":true, \
    \"set_color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"AAPL\", \
    \"name\":\"AAPL\", \
    \"discord_bot_token\":\"$AAPL\", \
    \"twelve_data_key\": \"$TWELVEDATA_API\",
    \"frequency\":15, \
    \"set_nickname\":true, \
    \"arrows\":true, \
    \"set_color\":true}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"TSLA\", \
    \"name\":\"TSLA\", \
    \"discord_bot_token\":\"$TSLA\", \
    \"twelve_data_key\": \"$TWELVEDATA_API\",
    \"frequency\":15, \
    \"set_nickname\":true, \
    \"arrows\":true, \
    \"set_color\":true}"
