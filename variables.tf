variable "branch_policy_auto_reviewers" {
  description = <<EOT
Map of branch_policy_auto_reviewers, attributes below
Required:
    - project_id
    - settings (block):
        - auto_reviewer_ids (required)
        - message (optional)
        - minimum_number_of_reviewers (optional)
        - path_filters (optional)
        - scope (required, block):
            - match_type (optional)
            - repository_id (optional)
            - repository_ref (optional)
        - submitter_can_vote (optional)
Optional:
    - blocking
    - enabled
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    project_id = string
    blocking   = optional(bool)
    enabled    = optional(bool)
    settings = object({
      auto_reviewer_ids           = list(string)
      message                     = optional(string)
      minimum_number_of_reviewers = optional(number)
      path_filters                = optional(list(string))
      scope = list(object({
        match_type     = optional(string)
        repository_id  = optional(string)
        repository_ref = optional(string)
      }))
      submitter_can_vote = optional(bool)
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.branch_policy_auto_reviewers : (
        length(v.settings.scope) >= 1
      )
    ])
    error_message = "Each scope list must contain at least 1 items"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

