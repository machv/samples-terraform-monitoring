/* app */
resource "azurerm_resource_group" "rg_app" {
  name     = "APP-PROD-DB-RG"
  location = "westeurope"
}

resource "azurerm_postgresql_flexible_server" "db01" {
  name                   = "psqlflexiservlmtes26"
  resource_group_name    = azurerm_resource_group.rg_app.name
  location               = azurerm_resource_group.rg_app.location
  version                = "13"
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  zone                   = "1"
  storage_mb             = 32768
  sku_name               = "B_Standard_B1ms"
}

module "monitor_pgsql" {
    source = "./modules/monitor-pgsql"

    rg = azurerm_resource_group.rg_app
    db = azurerm_postgresql_flexible_server.db01
    action_group = azurerm_monitor_action_group.action_dba
}
