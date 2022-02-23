resource "azurerm_resource_group" "rg_monitoring" {
  provider = azurerm.hub
  name     = "HUB-PROD-MON-RG"
  location = "westeurope"
}

resource "azurerm_monitor_action_group" "action_dba" {
  provider = azurerm.hub

  name                = "mail-dba"
  resource_group_name = azurerm_resource_group.rg_monitoring.name
  short_name          = "mail-dba"

  email_receiver {
    name          = "dba.cb.cz"
    email_address = "dba.cb.cz@o2.cz"
  }

  email_receiver {
    name          = "it_monitoring.cz"
    email_address = "it_monitoring.cz@o2.cz"
  }
}
