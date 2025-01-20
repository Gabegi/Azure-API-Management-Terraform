// secret from value
resource "azurerm_api_management_named_value" "nv-api-key" {
  name                = "api-key"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  display_name        = "secret-api-key"
  value               = var.api-key
  secret              = true // setting the field secret to true doesn't make this field sensitive in Terraform, instead it marks the value as secret and encrypts the value in Azure.
}

// secret from key vault
resource "azurerm_api_management_named_value" "nv-kv-api-key" {
  name                = "kv-api-key"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  display_name        = "kv-secret-api-key"

  secret              = true
  value_from_key_vault {
          secret_id = azurerm_key_vault_secret.example_secret.id
  }
}

