#!/usr/bin/env bash

ALIAS=rapidoacvdemo

echo "-->"
echo "--> Creating a scratch org ..."
echo "-->"

sf org create scratch  -f config/project-scratch-def.json -e enterprise -w 10 --json -a $ALIAS
sf config set target-org $ALIAS

sf project deploy start -d force-app/RapidoACVmini
sf org assign permset -n Rapido_ACV_Admin

sf project deploy start -d force-app/RapidoACVextras
sf org assign permset -n Rapido_ACV_Admin_extras

sf project deploy start -d force-app/DemoData
sf org assign permset -n Rapido_ACV_Admin_for_DemoData

echo "-->"
echo "--> Loading demo data ..."
echo "-->"

yes | sf plugins install sfdmu
cd datasets/sfdmu
sf sfdmu run -s csvfile -u $ALIAS
cd ../..

echo "-->"
echo "--> Opening ACV dashboard ..."
echo "-->"

sf org open -p "/lightning/o/Dashboard/home?queryScope=everything"

echo "-->"
echo "--> The org is ready."
echo "-->"
