output "branch_policy_auto_reviewers_id" {
  description = "Map of id values across all branch_policy_auto_reviewers, keyed the same as var.branch_policy_auto_reviewers"
  value       = { for k, v in azuredevops_branch_policy_auto_reviewers.branch_policy_auto_reviewers : k => v.id }
}
output "branch_policy_auto_reviewers_blocking" {
  description = "Map of blocking values across all branch_policy_auto_reviewers, keyed the same as var.branch_policy_auto_reviewers"
  value       = { for k, v in azuredevops_branch_policy_auto_reviewers.branch_policy_auto_reviewers : k => v.blocking }
}
output "branch_policy_auto_reviewers_enabled" {
  description = "Map of enabled values across all branch_policy_auto_reviewers, keyed the same as var.branch_policy_auto_reviewers"
  value       = { for k, v in azuredevops_branch_policy_auto_reviewers.branch_policy_auto_reviewers : k => v.enabled }
}
output "branch_policy_auto_reviewers_project_id" {
  description = "Map of project_id values across all branch_policy_auto_reviewers, keyed the same as var.branch_policy_auto_reviewers"
  value       = { for k, v in azuredevops_branch_policy_auto_reviewers.branch_policy_auto_reviewers : k => v.project_id }
}
output "branch_policy_auto_reviewers_settings" {
  description = "Map of settings values across all branch_policy_auto_reviewers, keyed the same as var.branch_policy_auto_reviewers"
  value       = { for k, v in azuredevops_branch_policy_auto_reviewers.branch_policy_auto_reviewers : k => one(v.settings) }
}

