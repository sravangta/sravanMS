# Step 1- The below line helps us to login to the Azure account
Login-AzureRmAccount
# Step 2- Create a Resource group named "VMAutomation"
New-AzureRmResourceGroup -Name VMAutomationGroup -Location "South Central US"
# Now, create a VM under newly created group "VMAutomationGroup"
#New-AzureRmResourceGroupDeployment -name "Dep14052017" -ResourceGroupName "VMAutomationGroup" -TemplateUri "C:\Users\v-srnarl\Desktop\SravanAutomation\CreateVMTemplate.json"
New-AzureRmResourceGroupDeployment -name "Dep14052017" -ResourceGroupName "TBD_ICTO-BIM-nonprod-01" -TemplateUri "C:\Users\v-srnarl\Desktop\SravanAutomation\CreateVMTemplate.json"
#Step3. Crate an automation acount for this VM under the resource group "VMAutomationGroup"

#Select your subscription if you have more than one

#Create a GUID for the job
$JobGUID = [System.Guid]::NewGuid().toString()

#Set the parameter values for the template
$Params = @{
    accountName = "Sravan" ;
    jobId = $JobGUID;
    # regionId = "South Central US";
    credentialName = "DefaultAzureCredential";
    userName = "sravan37"; 
    password = "Sravan37";
}

#$TemplateURI = @"C:\Users\v-srnarl\Desktop\SravanAutomation\CreateAutomationAccountWithRunBook.json"

New-AzureRmResourceGroupDeployment -TemplateParameterObject $Params -ResourceGroupName "VMAutomationGroup" -TemplateUri "C:\Users\v-srnarl\Desktop\SravanAutomation\CreateAutomationAccountWithRunBook.json"
