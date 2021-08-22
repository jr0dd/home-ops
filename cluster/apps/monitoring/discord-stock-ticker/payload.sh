#!/usr/bin/env bash

set -o nounset
set -o errexit

FREQ="10"
NICK="true"
COLOR="true"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"BTC\", \
    \"name\":\"bitcoin\", \
    \"discord_bot_token\":\"$BTC\", \
    \"crypto\":true, \
    \"frequency\":$FREQ, \
    \"set_nickname\":$NICK, \
    \"set_color\":$COLOR}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"DOGE\", \
    \"name\":\"dogecoin\", \
    \"discord_bot_token\":\"$DOGE\", \
    \"crypto\":true, \
    \"frequency\":$FREQ, \
    \"set_nickname\":$NICK, \
    \"set_color\":$COLOR}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"ETH\", \
    \"name\":\"ethereum\", \
    \"discord_bot_token\":\"$ETH\", \
    \"crypto\":true, \
    \"frequency\":$FREQ, \
    \"set_nickname\":$NICK, \
    \"set_color\":$COLOR}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"ZRX\", \
    \"name\":\"0x\", \
    \"discord_bot_token\":\"$ZRX\", \
    \"crypto\":true, \
    \"frequency\":$FREQ, \
    \"set_nickname\":$NICK, \
    \"set_color\":$COLOR}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"AMC\", \
    \"name\":\"AMC\", \
    \"discord_bot_token\":\"$AMC\", \
    \"frequency\":$FREQ, \
    \"set_nickname\":$NICK, \
    \"set_color\":$COLOR}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"AAPL\", \
    \"name\":\"AAPL\", \
    \"discord_bot_token\":\"$AAPL\", \
    \"frequency\":$FREQ, \
    \"set_nickname\":$NICK, \
    \"set_color\":$COLOR}"

curl -X POST \
"localhost:8080/ticker" \
-H "Content-Type: application/json" \
-d "{\"ticker\":\"TSLA\", \
    \"name\":\"TSLA\", \
    \"discord_bot_token\":\"$TSLA\", \
    \"frequency\":$FREQ, \
    \"set_nickname\":$NICK, \
    \"set_color\":$COLOR}"
