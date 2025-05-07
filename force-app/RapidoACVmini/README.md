# Rapido ACV minimal metadata

This folder contains the minimum set of metadata to configure Rapido ACV.

It may be used to deply Rapido ACV to any org.

## Contents

It contains :

- all the `ACV*` and `Revenue*` custom fields on the Opportunity object
- 2 dashboards : `ACV`and `Renouvellement`
- 10 reports for these dashboards
- 3 reports to use on the `Account` Lightning Record Page as `report graph`
- the `ACV Admin` permission set to assign to the Salesforce admin user

## Details about the fields

The following fields are editable :

- `ACV_Renewal_Start_Date__c` : start date of the contract period
- `ACV_Renewal_Expiry_Date__c` : end date of the contract period

If you wish to use other existing fields instead, change the following formulas :

- `ACV__c`
- `ACV_expected_revenue__c`
- `ACV_Y_1__c`
- `ACV_Y_2__c`
- `ACV_Y_3__c`

These fields contain the calculation of the ACV amount, prorata temporis. Change them if you want to calculate them according to a different rule.

All other ACV fields are formulas derived from these fields.

The `Revenue*` fields are formulas based on the value of the Opportunity `Type` field.
The expected types are provided in the `force-app/RapidoACVextras` folder.
If you wish to use you own values, change the definition of formulas in the `Renevue_by*` fields' formulas.
