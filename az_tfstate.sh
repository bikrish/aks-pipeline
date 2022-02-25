az group create -l eastus2 -n terraform-storage-rg
az storage account create -n biktfstatesstorage -g terraform-storage-rg -l eastus2 --sku Standard_LRS --kind StorageV2
az storage container create -n tfstatesfile  --account-name biktfstatesstorage


az storage copy -s ./terraform.tfstate -d https://biktfstatesstorage.blob.core.windows.net/tfstatesfile/
az storage copy -s https://biktfstatesstorage.blob.core.windows.net/tfstatesfile/terraform.tfstate -d ./terraform.tfstate


az group delete -n terraform-storage-rg -y --no-wait
az group delete -n NetworkWatcherRG -y --no-wait
