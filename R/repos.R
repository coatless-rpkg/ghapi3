#' Creates a Repository in an Organization or User Space
#'
#' Makes a repository to store code in.
#'
#' @param org                  Organization name.
#' @param name                 The name of the repository.
#' @param description          A short description of the repository.
#' @param homepage             A URL with more information about the repository.
#' @param private              Either `TRUE` to create a private repository or
#'                             `FALSE` to create a public one. Creating private
#'                             repositories requires a paid GitHub account.
#'                             Default: `FALSE`.
#' @param has_issues           Either `TRUE`  to enable issues for this
#'                             repository or `FALSE` to disable them.
#'                             Default: `TRUE`.
#' @param has_projects         Either `TRUE` to enable projects for this
#'                             repository or `FALSE` to disable them.
#'                             Default: `TRUE`. Note: If you're creating a
#'                             repository in an organization that has disabled
#'                             repository projects, the default is `FALSE`, and
#'                             if you pass `TRUE`, the API returns an error.
#' @param has_wiki             Either `TRUE` to enable the wiki for this
#'                             repository or `FALSE` to disable it.
#'                             Default: `TRUE`.
#' @param team_id              The id of the team that will be granted access to
#'                             this repository. This is only valid when creating
#'                             a repository in an organization.
#' @param auto_init	           Pass `TRUE` to create an initial commit with
#'                             empty `README`. Default: `FALSE`.
#' @param gitignore_template   Desired language or platform [.gitignore template](https://github.com/github/gitignore)
#'                             to apply. Use the name of the template without
#'                             the extension. For example, `"Haskell"`.
#' @param license_template     Choose an [open source license template](https://choosealicense.com/)
#'                             that best suits your needs, and then use the
#'                             [license keyword](https://help.github.com/articles/licensing-a-repository/#searching-github-by-license-type)
#'                             as the `license_template` string. For example,
#'                             `"mit"` or `"mpl-2.0"`. Default: `"gpl-3.0"`.
#' @param allow_squash_merge   Either `TRUE` to allow squash-merging pull
#'                             requests, or `FALSE` to prevent squash-merging.
#'                             Default: `TRUE`
#' @param allow_merge_commit   Either `TRUE` to allow merging pull requests
#'                             with a merge commit, or `FALSE` to prevent
#'                             merging pull requests with merge commits.
#'                             Default: `TRUE`
#' @param allow_rebase_merge   Either `TRUE` to allow rebase-merging pull
#'                             requests, or `FALSE` to prevent rebase-merging.
#'                             Default: `TRUE`
#'
#' @references
#' <https://developer.github.com/v3/repos/#create>
#' @rdname repo-creation
#' @export
create_user_repo = function(name, description = "This repository has been created with ghapi",
                            homepage = "https://github.com/coatless/ghapi",
                            private = FALSE,
                            has_issues = TRUE, has_projects = TRUE,
                            has_wiki = TRUE,
                            auto_init = FALSE,
                            gitignore_template = "R",
                            license_template = "gpl-3.0",
                            allow_squash_merge = TRUE,
                            allow_merge_commit = TRUE,
                            allow_rebase_merge = TRUE
                            ) {
  post_gh("POST /user/repos", org = org, name = name,
          description = description, homepage = homepage, private = private,
          has_issues = has_issues, has_projects = has_projects, has_wiki = has_wiki,
          auto_init = auto_init, gitignore_template = gitignore_template,
          license_template = license_template, allow_squash_merge = allow_squash_merge,
          allow_merge_commit = allow_merge_commit, allow_rebase_merge = allow_rebase_merge)
}

#' @rdname repo-creation
#' @export
create_org_repo = function(org, name,
                           description = "This repository has been created with ghapi",
                           homepage = "https://github.com/coatless/ghapi",
                           private = FALSE,
                           has_issues = TRUE, has_projects = TRUE,
                           has_wiki = TRUE,
                           team_id = NULL,
                           auto_init = FALSE,
                           gitignore_template = "R",
                           license_template = "gpl-3.0",
                           allow_squash_merge = TRUE,
                           allow_merge_commit = TRUE,
                           allow_rebase_merge = TRUE) {

  if(is.null(team_id)) {
    post_gh("POST /orgs/:org/repos", org = org, name = name,
            description = description, homepage = homepage, private = private,
            has_issues = has_issues, has_projects = has_projects, has_wiki = has_wiki,
            auto_init = auto_init, gitignore_template = gitignore_template,
            license_template = license_template, allow_squash_merge = allow_squash_merge,
            allow_merge_commit = allow_merge_commit, allow_rebase_merge = allow_rebase_merge)
  } else {
    post_gh("POST /orgs/:org/repos", org = org, name = name,
            description = description, homepage = homepage, private = private,
            has_issues = has_issues, has_projects = has_projects, has_wiki = has_wiki,
            team_id = team_id,
            auto_init = auto_init, gitignore_template = gitignore_template,
            license_template = license_template, allow_squash_merge = allow_squash_merge,
            allow_merge_commit = allow_merge_commit, allow_rebase_merge = allow_rebase_merge)
  }
}

#' List Self Repos
#'
#' Retrieve information on the repositories created or held by yourself.
#'
#' @param visibility  Can be one of `"all"`, `"public"`, or `"private"`. Default: `"all"`
#' @param affiliation Comma-separated list of values. Can include: `"owner"`,
#'                    `"collaborator"`, `"organization_member"`.
#'                    Default: `"owner,collaborator,organization_member"`.
#' @param type        Can be one of `"all"`, `"public"`, or `"private"`.
#'                    Default: `"all"`. Will cause a `422`` error if used in the
#'                    same request as `visibility` or `affiliation`.
#' @param sort        Can be one of `"created"`, `"updated"`, `"pushed"`, `"full_name"`.
#'                    Default: `"full_name"`.
#' @param direction   Can be one of `"asc"` or `"desc"`. Default: `"desc"`
#'
#' @export
#' @seealso [`get_user_repos_list`], [`get_org_repos_list`]
#' @references
#' <https://developer.github.com/v3/repos/#list-your-repositories>
get_self_repos_list = function(visibility = "all",
                               affiliation = "owner,collaborator,organization_member",
                               type = "all",
                               sort = "full_name",
                               direction = "desc") {


  get_gh("GET /user/repos", visibility = visibility, affiliation = affiliation,
         type = type, sort = sort, direction = direction)

}


#' List User Repositories
#'
#' Generates a list of user repositories
#'
#' @param username  Name of the GitHub user to retrieve repos for.
#' @param type      Can be one of `"all"`, `"owner"`, or `"member"`.
#'                  Default: `"owner"`.
#' @param sort      Can be one of `"created"`, `"updated"`, `"pushed"`, `"full_name"`.
#'                  Default: `"full_name"`.
#' @param direction Can be one of `"asc"` or `"desc"`. Default: `"desc"`
#'
#' @export
#' @seealso [`get_self_repos_list`], [`get_org_repos_list`]
#' @references
#' <https://developer.github.com/v3/repos/#list-user-repositories>
get_user_repos_list = function(username, type = "owner", sort = "full_name",
                               direction = "desc") {

  get_gh("GET /users/:username/repos", username = username,
         type = type, sort = sort, direction = direction)
}


#' List Organization Repositories
#'
#' Generates a list of organization repositories
#'
#' @param org  Name of the GitHub Organization to retrieve repos for.
#' @param type Can be one of `"all"`, `"public"`, `"private"`, `"forks"`,
#'             `"sources"`, `"member"`. Default: `"all"`.
#'
#' @export
#' @seealso [`get_self_repos_list`], [`get_user_repos_list`]
#' @references
#' <https://developer.github.com/v3/repos/#list-organization-repositories>
get_org_repos_list = function(org, type = "all") {

  get_gh("GET /orgs/:org/repos", org = org, type = type)

}

#' Retrieve list of contributors for a repo
#'
#' Obtains a list of people who have contributed code or text to a
#' repository
#'
#' @param owner Name of the person or organization who owns the repository.
#' @param repo  Name of the repository.
#' @param anon  Either `TRUE` to include anonymous contributors in results or
#'              `FALSE` to not include anonymous contributors. Default:
#'              `TRUE`.
#'
#' @export
#' @references
#' <https://developer.github.com/v3/repos/#list-contributors>
get_contributors_list = function(owner, repo, anon = TRUE) {
  get_gh("GET /repos/:owner/:repo/contributors", owner = owner,
         repo = repo, anon = anon)
}

#' Transfer a repository
#'
#' A transfer request will need to be accepted by the new owner when
#' transferring a personal repository to another user. The response will
#' contain the original owner, and the transfer will continue asynchronously.
#' For more details on the requirements to transfer personal
#' and organization-owned repositories, see
#' [about repository transfers](https://help.github.com/articles/about-repository-transfers/).
#'
#' @param owner     The username or organization name that controls the
#'                  repository.
#' @param repo      The name of the repository to transfer.
#' @param new_owner The username or organization name the repository will be
#'                  transferred to.
#' @param team_id   ID of the team or teams to add to the repository.
#'                  Teams can only be added to organization-owned repositories.
#'
#' @export
#' @references
#' <https://developer.github.com/v3/repos/#transfer-a-repository>
transfer_repo = function(owner, repo, new_owner, team_id = NA) {
  if( is.na(team_id) ) {
    gh("POST /repos/:owner/:repo/transfer",
       owner = owner,
       repo = repo,
       new_owner = new_owner,
       .send_headers = c("Accept" = "application/vnd.github.nightshade-preview+json"))
  } else {
    gh("POST /repos/:owner/:repo/transfer",
       owner = owner,
       repo = repo,
       new_owner = new_owner,
       team_id = team_id,
       .send_headers = c("Accept" = "application/vnd.github.nightshade-preview+json"))
  }
}



