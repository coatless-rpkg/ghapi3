#' Create a Tag
#'
#' Tag a specific portion of code
#'
#' @param owner   Name of the person or organization who owns the repository.
#' @param repo    Name of the repository.
#' @param tag   	The tag's name. This is typically a version (e.g., "v0.0.1").
#' @param message	The tag message.
#' @param object	The SHA of the git object this is tagging.
#' @param type  	The type of the object we're tagging. Normally this is a commit but it can also be a tree or a blob.
#'
#' @references
#' <https://developer.github.com/v3/git/tags/#create-a-tag-object>
#' @export
create_tag = function(owner, repo, tag, message, object, type) {
  post_gh("POST /repos/:owner/:repo/git/tags", owner = owner, repo = repo,
     tag = tag, message = message, object = object, type = type)
}
