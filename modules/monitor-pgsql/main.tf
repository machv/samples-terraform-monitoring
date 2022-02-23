resource "azurerm_monitor_metric_alert" "alert_connections" {
  name                = "active-connections-alert"
  resource_group_name = var.rg.name
  scopes              = [var.db.id]
  severity            = 1 # (0 = Critical, 1 = Error, 2 = Warning, 3 = Informational, 4 = Verbose)
 
  criteria {
    metric_namespace = "Microsoft.DBForPostgreSql/flexibleServers"
    metric_name      = "active_connections"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 1000
  }

  action {
    action_group_id = var.action_group.id
  }
}

resource "azurerm_monitor_metric_alert" "alert_storage_50" {
  name                = "db01-alert-storage-50"
  resource_group_name = var.rg.name
  scopes              = [var.db.id]
  severity            = 2 # (0 = Critical, 1 = Error, 2 = Warning, 3 = Informational, 4 = Verbose)
 
  criteria {
    metric_namespace = "Microsoft.DBForPostgreSql/flexibleServers"
    metric_name      = "storage_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 50
  }

  action {
    action_group_id = var.action_group.id
  }
}

resource "azurerm_monitor_metric_alert" "alert_storage_80" {
  name                = "db01-alert-storage-80"
  resource_group_name = var.rg.name
  scopes              = [var.db.id]
  severity            = 1 # (0 = Critical, 1 = Error, 2 = Warning, 3 = Informational, 4 = Verbose)
 
  criteria {
    metric_namespace = "Microsoft.DBForPostgreSql/flexibleServers"
    metric_name      = "storage_percent"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = var.action_group.id
  }
}
