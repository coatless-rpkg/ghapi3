#' List teams or retrieve a team's details
#'
#' Generate a list of teams in the organization or
#' retrieve a specific team's information.
#'
#' @param org       Organization name.
#'
#' @references
#' <https://developer.github.com/v3/teams/#list-teams>
#' @rdname team-listing
#' @export
get_org_teams_list = function(org) {
  get_gh("GET /orgs/:org/teams", org = org)
}

#' @inheritParams add_team_member
#' @references
#' <https://developer.github.com/v3/teams/#get-team>
#' @rdname team-listing
#' @export
get_org_team_details = function(id) {
  get_gh("GET /teams/:id", id = id)
}

#' Add or update team membership
#'
#' Includes a GitHub user as a member of an Organization's team or updates
#' their membership status.
#'
#' @param id       Team ID Number.
#' @param username Name of the user on GitHub.
#' @param role     The role that this user should have in the team. Can be one of:
#'                  `"member"` or `"maintainer"`. Default: `"member"`
#'
#' @section Role:
#' The role that this user should have in the team. Can be one of:
#' - `"member"`
#'     - a normal member of the team.
#' - `"maintainer"`
#'     - a team maintainer. Able to add/remove other team members, promote other
#'       team members to team maintainer, and edit the team's name and description.
#' @references
#' <https://developer.github.com/v3/teams/members/#add-or-update-team-membership>
#' @rdname team-membership
#' @export
add_team_member = function(id,
                           username,
                           role = c("member", "maintainer")) {
  # Require type
  role = match.arg(role)

  put_gh(
    "PUT /teams/:id/memberships/:username",
    id = id,
    username = username,
    role = role
  )
}

#' @section Remove Team Member:
#' This does not delete the user on GitHub nor does it remove the user from
#' the GitHub organization. This functionality only suppresses users from
#' being identified as a member of a team.
#' @references
#' <https://developer.github.com/v3/teams/members/#remove-team-membership>
#' @export
#' @rdname team-membership
remove_team_member = function(id, username) {
  delete_gh("PUT /teams/:id/memberships/:username",
            id = id,
            username = username)
}
