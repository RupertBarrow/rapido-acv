# Rapido ACV

## Contents

- `force-app/RapidoACVmini` : the minimum set of metadata to configure Rapido ACV. See `force-app/RapidoACVmini/README.md`
- `force-app/RapidoACVextras` : extra optional set of metadata to configure Rapido ACV. See `force-app/RapidoACVextras/README.md`
- `force-app/DemoData` : metadata necessary to load the Rapido ACV demo data set. See `force-app/DemoData/README.md`
- `datasets` : a Rapido ACV demo dataset which you can load with Cumulus CI (see below)

## Deploy to a Salesforce Developer org

<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

## Deploy from VS Code

1. Install the `Salesforce Extension Pack`
2. Download this repo from Github, and open it in VS Code
3. Set your default org in VS Code : run the `SFDX: Set Default Org` command in the command palette (CTRL-SHIFT-P, or CMD-SHIFT-P on Mac)
4. Right-click on the `force-app/RapidoACVmini` folder and select `SFDX: Deploy This Source to Org`
5. If you wish, right-click on the `force-app/RapidoACVextras` folder and select `SFDX: Deploy This Source to Org`
6. In Salesforce, assign the `ACV Admin`permission set to you admin user

## Deploy with CumulusCI

1. [Set up CumulusCI](https://cumulusci.readthedocs.io/en/latest/tutorial.html)
1. Run `cci flow run deploy_rapido_acv_mini --org dev` to deploy the Rapido ACV minimal metadata to your dev scratch org.
1. Run `cci flow run deploy_rapido_acv_extras --org dev` to deploy the Rapido ACV optional extra metadata to your dev scratch org.

## Deploy a demo dataset with CumulusCI in a scratch org

If you want to add some demo data to visualize them in the dashboard, follow the following instructions.

** DO NOT RUN THIS IN A SANDBOX WHICH ALREADY CONTAINS DATA **

1. Make sure you have already deployed Rapido ACV to your org
1. run `cci flow run deploy_rapido_acv_demodata --org dev` : this will deploy extra metadata from `force-app/DemoData`, assign the `ACV Admin for DemoData` permission set to the user and load the demo dataset
1. Open the Rapido ACV dashboards in your web browser : `cci task run open_org --org dev --path "lightning/o/Dashboard/home"`
