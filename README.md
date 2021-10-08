# spring-cloud-gh-actions-sample
This sample is a preparation for Azure Samples Contrib


# Setup the infrastructure

1. Define environment variables.

```bash
RESOURCE_GROUP='spring-cloud-demos'
LOCATION=westus
```

1. Login to your Azure account and make sure the correct subscription is active. 

```azurecli
az login
az account list -o table
az account set <your-subscription-id>
```

1. Create a resource group for all necessaryr resources> 

```azurecli
az group create --name $RESOURCE_GROUP --location $LOCATION
```

1. Copy the resource group ID which is outputted in the previous step to a new environment variable.

```azurecli
RESOURCE_GROUP_ID=<resource group IP from previous output>
```

1. Create a service principal and give it access to the resource group.

```azure cli
az ad sp create-for-rbac \
  --name SpringCloudGHBicepActionWorkflow \
  --role Contributor \
  --scopes $RESOURCE_GROUP_ID \
  --sdk-auth
```

1. Copy the full output from this command. 

1. In your GitHub repo navigate to *Settings* > *Secrets* and select *New Repository Secret*.

1. Name the secret _AZURE_CREDENTIALS_ and paste the output from the 'az ad sp create-for-rbac' command in the value textbox.

1. Select *Add Secret*.

1. Inspect the [infra-deploy.yml](.github/workflows/infra-deploy.yml) file and update any environment variables at the top of the file to reflect your environment. 

1. In your GitHub repo, navigate to *Actions* and select the *infra-deploy* action. 

1. Select *Run workflow* > *Run workflow*. 

1. This will start a new workflow run and deploy the necessary infrastructure. 
