#!/bin/sh
HOST=$(cat host.cfg)
ssh-agent bash deploy2.sh $HOST

