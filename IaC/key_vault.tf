resource "azurerm_key_vault" "kv01" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = var.key_vault_sku

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    certificate_permissions = [
      "Create", "Import", "Get"
    ]
  }
}

resource "azurerm_key_vault_certificate" "certificate" {
  name         = var.certificate_name
  key_vault_id = azurerm_key_vault.kv01.id

  certificate {
    contents = filebase64(var.certificate_path)
    password = var.certificate_password
  }
}