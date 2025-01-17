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
    #   example      = {jsonencode({
    #     id    = "12345",
    #     name  = "John Doe",
    #     email = "john.doe@example.com"
    #   })
    }

    }
}

# resource "azurerm_api_management_api_operation" "example_operation" {
#   operation_id        = "getUser"
#   api_name            = azurerm_api_management_api.mock_api.name
#   api_management_name = azurerm_api_management.apim.name
#   resource_group_name = azurerm_resource_group.rg.name
#   display_name        = "Get User"
#   method              = "GET"
#   url_template        = "/users/{userId}"
  
#   response {
#     status_code = 200
#     description = "Successful response with user details."
#     header {
#       name  = "Content-Type"
#       required = true
#       type = "application/json"
#     }
#     representation {
#       content_type = "application/json"
      
#     #   example {
#     #     name = "example"
#     #     summary     = "Example of a user response"
#     #     description = "A sample response with user details."
#     #     value       = <<JSON
#     #                     {
#     #                     "id": "12345",
#     #                     "name": "John Doe",
#     #                     "email": "john.doe@example.com"
#     #                     }
#     #                     JSON
#     #                         }
#     }
#   }
# }
