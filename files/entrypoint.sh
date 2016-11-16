#!/bin/bash

/usr/bin/supervisord
sleep 30
/deploy_engine.sh
