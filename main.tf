provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "./azurerm/resource_group"
}

module "data_factory" {
  source = "./azurerm/data_factory"
  rg = module.resource_group.azurerm_resource_group_rg_name
  rg_loc = module.resource_group.azurerm_resource_group_rg_location
}

module "mongodb" {
  source = "./azurerm/mongodb"
  rg = module.resource_group.azurerm_resource_group_rg_name
  rg_loc = module.resource_group.azurerm_resource_group_rg_location
  password = "Password1234!"
  prefix = "pluralsightmongodb"
  username = "pluralsightadmin"
}

module "cosmosdb" {
  source = "./azurerm/cosmosdb"
  rg = module.resource_group.azurerm_resource_group_rg_name
}
