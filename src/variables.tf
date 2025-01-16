
variable "subscription_id" {
    type        = string
  description = "Subscription ID"
}

variable "test-api-json" {
  type        = string
  description = "JSON format test api spec"
  default = "https://raw.githubusercontent.com/hashicorp/terraform-provider-azurerm/refs/heads/main/internal/services/apimanagement/testdata/api_management_api_schema_swagger.json"
}