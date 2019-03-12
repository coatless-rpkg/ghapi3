#' @export
#' @rdname commit_diff_url
create_url_commit_diff = function(user, repo, start, end) {
    url = paste0("https://github.com/", user, "/", repo,"/compare/",
                 start, "...", end)
}

#' View Web Interface Showing Commit Differences
#'
#' Generates a URL to GitHub's web-based commit comparison interface and
#' opens it if session is interactive.
#'
#' @param user  Name of the User Account
#' @param repo  Name of the Repository
#' @param start Start commit, tag, date, or branch
#' @param end   End commit, tag, date, or branch
#'
#' @return A URL of the form:
#'
#' `https://github.com/<user>/<repo>/compare/<start>...<end>`
#'
#' @details
#'
#' The gist of possible comparisons is given in the next table.
#'
#' | Comparison Type   |  start              |     end                                   |
#' |:------------------|:-------------------:|:-----------------------------------------:|
#' | Forks             | `master`            | `octo-org:master`                         |
#' | Tags              | `v2.2.0`            | `octocat:v2.3.3`                          |
#' | Branches          | `master`            | `octocat:an-example-comparison-for-docs`  |
#' | Time              | `master@{2weeks}`   | `master`                                  |
#' | Time              | `master@{MM-DD-YY}` | `master`                                  |
#' | Commits           | `c3a414e`           | `faf7c6f`                                 |
#' | Commits           | `96d29b7^^^^^`      | `96d29b7`                                 |
#'
#' @references
#' <https://help.github.com/en/articles/comparing-commits-across-time>
#' @examples
#'
#' browse_commit_diff("coatless", "ghapi3", start = "ab469f8", end = "f15f06e")
#'
#' @export
#' @rdname commit_diff_url
#' @importFrom utils browseURL
browse_commit_diff = function(user, repo, start, end) {
  url = create_url_commit_diff(user, repo, start, end)

  if(interactive()) {
    utils::browseURL(url)
  }

  invisible(url)
}
