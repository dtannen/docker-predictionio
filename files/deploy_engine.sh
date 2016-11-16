#!/bin/bash

set -e

# Get Template
yes n | pio template get dtannen/template-scala-parallel-universal-recommendation CustomEngine --version v0.2.3 --name template --package org.template --email template@template.org

cd /CustomEngine

pio app new pinion || true

sed -i.bak s/\"handmade\"/\"pinion\"/g engine.json

APPKEY=`pio app list | awk 'NR==2 { print $7 }'`
python examples/import_handmade.py --access_key $APPKEY

# Build the engine
pio build --verbose

# Train the engine
pio train

# Deploy the engine
pio deploy
