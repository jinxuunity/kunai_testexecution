#!/usr/bin/env python

# Send the error message in xuint report to slack channel.

import time, os, sys
from slackclient import SlackClient

errmsg = sys.argv[1]
if (sys.argv[2]):
    channel = sys.argv[2]
else:
    channel = "@jinxu"    

f = open('slacktoken.txt', 'r')
token = f.read()
f.close()

botToken = token
botUsername = "@jinxu"
#botChannel = "G396UA2RY"  # pack-distribute
#botChannel = "@jinxu"    # own slackbot
botChannel = channel

#f = open('errorfile.txt', 'r');

if len(sys.argv) > 1:
    msg = sys.argv[1]
else:
    msg = "No Message"
#f.close()

if not botToken:
    print("A slack token is required using ENV of SLACK_TOKEN")
    sys.exit(1)

if not botUsername:
    botUsername = "slackbot"
    asUser = True
else:
    asUser = False

if not botChannel:
    botChannel = "#general"

sc = SlackClient(botToken)

print(sc.api_call("chat.postMessage", channel=botChannel, username=botUsername, as_user=asUser, text=msg))