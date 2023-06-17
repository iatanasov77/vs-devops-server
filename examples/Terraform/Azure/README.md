First You Need to Login in Azure to Can Create Azure Resources With Terraform.

To Login You Can Use AzureCli with username and password: az login --username azureusername --password azurepassword
    OR JUST 'az login'
Will Give You a Device ID That You have to register in 'https://microsoft.com/devicelogin'


Also You Should Have an azurerm Arguments. For Reference: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

For Run These Examples Copy Them into '/vagrant/tmp/' directory. Next ..
    1. Create Variable Values File For Example in '/vagrant/tmp/TerraformExamplesVariables/softuni-taskboard-values.tfvars'
    2. Go to an application: cd /vagrant/tmp/TestTerraform/Azure/TaskBoardApp
    3. Run: terraform init
    4. Run: terraform apply -var-file="/vagrant/tmp/TerraformExamplesVariables/softuni-taskboard-values.tfvars"



IF YOU APPLICATION IN: 'Azure Active Directory -> App registrations -> <APPLICATION>' is not registered to use some namespace,
For Example 'Microsoft.Web' OR 'Microsoft.Sql' , You Can Add This From Azure Web Dashboard or with Azure Cli using next Command:

$ az provider register -n Microsoft.Web
$ az provider register -n Microsoft.Sql

And Wait until Registration is Done. You can Monitor Registration Process With:

$ az provider show -n Microsoft.Web
    OR
$ az provider show -n Microsoft.Sql

