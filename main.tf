resource "azuredevops_project" "project" {
  name        = "mina"
  description = "ITI azure devops lab"
}

resource "azuredevops_agent_pool" "linux" {
  name           = "my-pool"
}

resource "azuredevops_agent_queue" "linux" {
  project_id    = azuredevops_project.project.id
  agent_pool_id = azuredevops_agent_pool.linux.id
}

resource "azuredevops_resource_authorization" "linux_pool_authorization" {
  project_id  = azuredevops_project.project.id
  resource_id = azuredevops_agent_queue.linux.id
  type        = "queue"
  authorized  = true
}

