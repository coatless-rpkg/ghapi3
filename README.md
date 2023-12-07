
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![R-CMD-check](https://github.com/coatless-rpkg/ghapi3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/coatless-rpkg/ghapi3/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## ghapi3

The goal of `ghapi3` is to provide a full-featured interface to GitHub’s
API v3.0. To do this, we use the [`gh`](https://github.com/r-lib/gh) *R*
package to access the GitHub API’s methods.

### Installation

You can install `ghapi3` from github with:

``` r
if(!requireNamespace("remotes", quietly = TRUE)) { install.packages("remotes") }
remotes::install_github("coatless-rpkg/ghapi3")
```

### Implementation

We have support presently for:

| Implemented Functions        |
|:-----------------------------|
| add_collaborator             |
| add_org_member               |
| add_org_team_member          |
| browse_commit_diff           |
| check_org_private_membership |
| check_org_public_membership  |
| create_org_invitation_email  |
| create_org_invitation_ghname |
| create_org_repo              |
| create_tag                   |
| create_url_commit_diff       |
| create_user_repo             |
| get_collaborator_list        |
| get_contributors_list        |
| get_emoji_list               |
| get_org_invitations          |
| get_org_members_list         |
| get_org_repos_list           |
| get_org_team_details         |
| get_org_team_invitations     |
| get_org_teams_list           |
| get_self_repos_list          |
| get_user_repos_list          |
| remove_collaborator          |
| remove_org_member            |
| remove_org_team_member       |
| transfer_repo                |
| update_org_member_role       |

### License

GPL (\>= 2)
