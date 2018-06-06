#' List Collaborators
#'
#' Obtain the names of all collaborators
#'
#' @param owner       Name of the repository owner.
#' @param repo        Name of the repository.
#' @param affiliation The affiliation level of collaborators. Can be one of:
#'                  `"outside"`, `"direct"`, or `"all"`. Default: `"all"`
#'
#' @section Affiliation:
#'
#' Filter collaborators returned by their affiliation. Can be one of:
#' - `"outside"`
#'     - All outside collaborators of an organization-owned repository.
#' - `"direct"`
#'     - All collaborators with permissions to an organization-owned repository,
#'      regardless of organization membership status.
#' - `"all"`
#'     - All outside collaborators of an organization-owned repository.
#'
#' @references
#' <https://developer.github.com/v3/repos/collaborators/#list-collaborators>
#' @export
get_collaborator_list = function(owner, repo, affiliation = c("all", "outside", "direct")) {

  affiliation = match.arg(affiliation)

  get_gh("GET /repos/:owner/:repo/collaborators",
         owner = owner,
         repo = repo,
         affiliation = affiliation,
         .send_headers = c("Accept" = "application/vnd.github.hellcat-preview+json")
         )
}

#' Add a Collaborator to a Repository
#'
#' Invite a user to a repository as a collaborator.
#'
#' @inheritParams get_collaborator_list
#' @param username   Name of the user.
#' @param permission The permission to grant the collaborator. Can be one of:
#'                  `"pull"`, `"push"`, or `"admin"`. Default: `"push"`
#'
#' @section Permission:
#'
#' The permission to grant the collaborator.
#' **Only valid on organization-owned repositories.** Can be one of:
#' - `"pull"`
#'     - can pull, but not push to or administer this repository
#' - `"push"`
#'     - can pull and push, but not administer this repository.
#' - `"admin"`
#'     - can pull, push and administer this repository.
#'
#' @references
#' <https://developer.github.com/v3/repos/collaborators/#add-user-as-a-collaborator>
#' @export
add_collaborator = function(owner, repo, username,
                            permission = c("push", "pull", "admin")) {

  permission = match.arg(permission)

  put_gh("PUT /repos/:owner/:repo/collaborators/:username",
         owner = owner,
         repo = repo,
         username = username,
         permission = permission)
}

#' Remove a Collaborator from a Repository
#'
#' Delete a repository collaborator.
#'
#' @inheritParams get_collaborator_list
#' @param username Name of the user.
#'
#' @references
#' <https://developer.github.com/v3/repos/collaborators/#remove-user-as-a-collaborator>
#' @export
remove_collaborator = function(owner, repo, username) {
  delete_gh("DELETE /repos/:owner/:repo/collaborators/:username",
         owner = owner,
         repo = repo,
         username = username)
}
