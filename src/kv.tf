resource "azurerm_key_vault" "kv" {
  name                = "my-amazing-keyvault"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"
}

resource "azurerm_key_vault_secret" "example_secret" {
  name         = "my-secret-name"
  value        = "my-super-secret-value"
  key_vault_id = azurerm_key_vault.kv.id

  // Optional attributes
  content_type = "example-content-type"  # E.g., "password", "API key", etc.
  tags = {
    environment = "dev"
  }

  depends_on = [ azurerm_key_vault_access_policy.access_policy ]
}

resource "azurerm_key_vault_access_policy" "access_policy_apim" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_user_assigned_identity.apim_identity

  secret_permissions = ["Get", "Set"]
}

// adding myself to read and create secrets
resource "azurerm_key_vault_access_policy" "access_policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  secret_permissions = ["Get", "Set"]
}