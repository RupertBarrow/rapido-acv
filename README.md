# Rapido ACV

## Contents

- `force-app/RapidoACVmini` : the minimum set of metadata to configure Rapido ACV. See `force-app/RapidoACVmini/README.md`
- `force-app/RapidoACVextras` : extra optional set of metadata to configure Rapido ACV. See `force-app/RapidoACVextras/README.md`
- `force-app/DemoData` : metadata necessary to load the Rapido ACV demo data set. See `force-app/DemoData/README.md`
- `datasets` : a Rapido ACV demo dataset which you can load with Cumulus CI (see below)

## Deploy metadata to a Salesforce Developer org, without demo data

<a href="https://githubsfdeploy.herokuapp.com?owner=RupertBarrow&repo=rapido-acv&ref=main">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

then assign the following permission sets to the administrator : `Rapido ACV Admin` and `Rapido ACV Admin extras`

## Deploy metadata from VS Code, without demo data

1. Install the `Salesforce Extension Pack`
2. Download this repo from Github, and open it in VS Code
3. Set your default org in VS Code : run the `SFDX: Set Default Org` command in the command palette (CTRL-SHIFT-P, or CMD-SHIFT-P on Mac)
4. Right-click on the `force-app/RapidoACVmini` folder and select `SFDX: Deploy This Source to Org`
5. If you wish, right-click on the `force-app/RapidoACVextras` folder and select `SFDX: Deploy This Source to Org`
6. In Salesforce, assign the following permission sets to the administrator : `Rapido ACV Admin` and `Rapido ACV Admin extras`

## Deploy metadata with Cumulus CI, without demo data

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
1. Run `cci flow run deploy_rapido_acv_mini --org dev` to deploy the Rapido ACV minimal metadata to your dev scratch org with the appropriate permission set
1. Run `cci flow run deploy_rapido_acv_extras --org dev` to deploy the Rapido ACV optional extra metadata to your dev scratch org with the appropriate permission set

## Deploy demo data with CumulusCI to a scratch org

If you want to deploy some demo data with Cumulus CI to visualize them in the dashboard, follow the following instructions.

** DO NOT RUN THIS IN A SANDBOX OR PRODUCTION ORG WHICH ALREADY CONTAINS DATA **

1. Make sure you have already deployed Rapido ACV to your org
1. run `cci flow run deploy_rapido_acv_demodata --org dev` : this will deploy extra metadata from `force-app/DemoData`, assign the `ACV Admin for DemoData` permission set to the user and load the demo dataset
1. Open the Rapido ACV dashboards in your web browser : `cci task run open_org --org dev --path "lightning/o/Dashboard/home"`

## Deploy metadata and demo data with an SF CLI script to a scratch org

To deploy metadata and demo data to a scratch org, follow the following instructions.

** DO NOT RUN THIS IN A SANDBOX OR PRODUCTION ORG WHICH ALREADY CONTAINS DATA **

1. open a Terminal on your computer or in VS Code
1. make sure that you are logged in to your Dev Hub
1. make sur that the SF CLI is installed
1. run `./orgInit.sh` : this will

- deploy the metadata to your scratch org,
- assign permission sets to the user
- load the demo data
- open the `ACV` dashboard
