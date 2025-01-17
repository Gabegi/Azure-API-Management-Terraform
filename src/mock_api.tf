resource "azurerm_api_management_api" "mock_api" {
  name                = "mock-api"
  resource_group_name = azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.apim.name
  revision            = "1"
  display_name        = "Mock API"
  path                = "mockapi"
  protocols           = ["https"]
}

resource "azurerm_api_management_api_operation" "mock_operation" {
  operation_id          = "get-hello"
  api_name              = azurerm_api_management_api.mock_api.name
  api_management_name   = azurerm_api_management.apim.name
  resource_group_name   = azurerm_resource_group.rg.name
  display_name          = "Get Hello"
  method                = "GET"
  url_template          = "/hello"

// Mocking response
  response {
    status_code = 200
    description = "<b>Success:</b> This is a mocked response."

    header {
      name  = "Content-Type"
      required = true
      type = "application/json"
    }

    representation {
      content_type = "application/json"
    }

    }
}

resource "azurerm_api_management_api_policy" "mock_policy" {
  api_name              = azurerm_api_management_api.mock_api.name
  api_management_name   = azurerm_api_management.apim.name
  resource_group_name   = azurerm_resource_group.rg.name

    xml_content = <<XML
<policies>
    <inbound>
        <base />
        <return-response>
            <set-status code="200" reason="OK" />
            <set-header name="Content-Type" exists-action="override">
                <value>application/json</value>
            </set-header>
            <set-body>
                {
                  "message": "it works"
                }
            </set-body>
        </return-response>
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
    </outbound>
</policies>
XML
}
