**Prerequisites**

1. Active azure account with an enabled subscription.
2. AzureCLI 2.0 installed on the system you are running this code from.
3. Terraform binary will need to be downloaded and placed on the PATH as per the Hashicorp terraform installation instructions.
4. A service principle will need to be created.
5. A vars.tfvars file will need to be created and populated with the following ENC variables:
  - ENC__sp_client_id
  - ENC__sp_client_secret
  - ENC__ssh_key
  - aksdemo_sa
  - aksdemo_cr

**Overview**

This code will build out the kubernetes cluster in azure using the AKS service.  As this is for demo purposes, I have kept the cluster configuration basic.

Firstly, this will create a resource group for the kubernetes service to run in, as well as all the other components required for this demo.  It will deploy in West Europe but this can easily be changed i the variables.tf file.  Before changing this, it's advisable to check whether the region you are changing to supports AKS.

Next, the code will provision a storage account for a new container registry as well as the container registry itself

The code will deploy a 1 node cluster but this figure can easily be changed in the aks.tf file by increasing the count number under the agent_pool_profile code block.

The vm size can also be changed in the variables file by changing the variable named vm_size

**Variables**

There are five variables detailed in the prerequisites, three of which contain sensitive data.  All variables in the variables.tf file have been described in the description block of each variable.

**Customisation**

The code is mostly parameterised, which means the deployment for the most part can be customised.  The following elements can be customised via the variables file:

  - default azure region
  - kubernetes cluster dns prefix
  - vm size that will run the kubernetes cluster
  - the name of the resource group
  - the type of environment being deployed (eg. dev/test/demo)
  - the name of the storage account
  - the name of the container registry
  - the name of the kubernetes cluster
  - the admin username

All variables have the description declared to make it easy to understand.

If you would like to change the node count in the agent pool or the size of the disk for the OS, this can be done by changing the numerical values in the aks.tf script within the azurerm_kubernetes_cluster resource block, and further within the nested agent_pool_profile block of code

**Instructions**

Ensure all of the prequites have been met before proceeding.

1. Obtain the access key for your storage account and run the prequisites.sh script.  you will be prompted to enter the Access key you have just obtained.

2. Run the following command "az login".  Copy the code and navigate to the url that appears.  paste the code in and log in to azure when prompted.

3. Change directory into the aks folder and run "terraform init" to initialize the back end of terraform.

4. Create a terraform plan by running the following command "terraform plan --var-file=vars.tfvars --out=.tfplan".

5. Apply the plan you created in the previous step by running "terraform apply .tfplan".  AKS is made up of many components which will need to be deployed in to azure so this will take approximately 15-20 minutes to complete.
