resource "azuredevops_branch_policy_auto_reviewers" "branch_policy_auto_reviewers" {
  for_each = var.branch_policy_auto_reviewers

  project_id = each.value.project_id
  blocking   = each.value.blocking
  enabled    = each.value.enabled

  settings {
    auto_reviewer_ids           = each.value.settings.auto_reviewer_ids
    message                     = each.value.settings.message
    minimum_number_of_reviewers = each.value.settings.minimum_number_of_reviewers
    path_filters                = each.value.settings.path_filters
    dynamic "scope" {
      for_each = each.value.settings.scope
      content {
        match_type     = scope.value.match_type
        repository_id  = scope.value.repository_id
        repository_ref = scope.value.repository_ref
      }
    }
    submitter_can_vote = each.value.settings.submitter_can_vote
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

