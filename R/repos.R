#' Creates a Repository in an Organization or User Space
#'
#' Makes a repository to store code in.
#'
#' @param org                  Organization name.
#' @param team_id              The id of the team that will be granted access to
#'                             this repository. This is only valid when creating
#'                             a repository in an organization.
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
