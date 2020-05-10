Write-Output "Create App Service using Docker image"

Write-Output "log into Azure Cloud"
$ans = Read-Host "press enter"
Write-Host "proceeding to login"
Write-Output "...."
az login

Write-Output "creating resource group"
az group create --name myResourceGroup --location "EastUS"

Write-Output "creating docker dfaRegistry"
az acr create --name dfaRegistry --resource-group myResourceGroup --sku Basic --admin-enabled true

Write-Output "showing credentials ---shhh!  this is secret stuff! "
az acr credential show --name dfaRegistry

Write-Output "To log into the registry - enter password shown above"
docker login dfaRegistry.azurecr.io --username dfaRegistry

Write-Output "next we will build the docker image"
$ans = Read-Host "press enter to proceed"
docker build -t mynodeexample1 .

Write-Output "nice work now lets list our docker images"
docker images

Write-Output "tag the image so that we can push it into our registry"
docker tag mynodeexample1 dfaRegistry.azurecr.io/mynodeexample1:v1.0.0

Write-Output "listing images again so that we can verify the tag"
docker images

Write-Output "next we push the image to the registry"
$ans = Read-Host "press enter"
docker push dfaRegistry.azurecr.io/mynodeexample1:v1.0.0

Write-Output "list images in registry"
az acr repository list -n dfaRegistry

Write-Output "next we create an appservice plan"
#az appservice plan create --name myAppServicePlan --resource-group myResourceGroup --sku F1 --is-linux

Write-Output "create the app service and specify the docker image"
#az webapp create -g MyResourceGroup -p MyPlan -n MyUniqueAppName -i myregistry.azurecr.io/docker-image:tag
#az webapp create --resource-group myResourceGroup --plan myAppServicePlan --name myWebApp1 --deployment-container-image-name dfaRegistry.azurecr.io/mynodeexample:v1.0.0
#az webapp create -g myResourceGroup -p myAppServicePlan -n DevOpsForArchitectsWebApp1 -i dfaRegistry.azurecr.io/mynodeexample:v1.0.0
az webapp config container set --docker-custom-image-name mynodeexample:v1.0.0 --docker-registry-server-password StrongPassword --docker-registry-server-url https://dfaRegistry.azurecr.io --docker-registry-server-user dfaRegistry --name DevOpsForArchitectsWebApp1 --resource-group myResourceGroup
