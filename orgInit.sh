#!/usr/bin/env bash

ALIAS=rapidoacvdemo

echo "-->"
echo "--> Creating a scratch org ..."
echo "-->"

sf org create scratch  -f config/project-scratch-def.json -e enterprise -w 10 --json -a $ALIAS
sf config set target-org $ALIAS

sf project deploy start -d force-app/RapidoACVmini
sf org assign permset -n ACV_Admin

sf project deploy start -d force-app/RapidoACVextras
sf org assign permset -n ACV_Admin_extras

sf project deploy start -d force-app/DemoData
sf org assign permset -n ACV_Admin_for_DemoData

echo "-->"
echo "--> Loading demo data ..."
echo "-->"

sf plugins install sfdmu
cd datasets/sfdmu
sf sfdmu run -s csvfile -u $ALIAS
cd ../..

DASHBOARD_ID=$(sf data query -q "SELECT Id FROM Dashboard WHERE Title = 'ACV' LIMIT 1" --json | jq -r '.result.records[0].Id')

# Add the dashboard ID to the URL for the second org open command
sf org open -p "/lightning/r/Dashboard/$DASHBOARD_ID/view"

echo "-->"
echo "--> The org is ready."
echo "-->"
