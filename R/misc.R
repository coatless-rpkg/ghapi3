#' List of Emoji Code and Image URLs
#'
#' Lists all the emojis available to use on GitHub.
#'
#' @export
#'
#' @references
#' <https://developer.github.com/v3/emojis/#emojis>
get_emoji_list = function() {
  get_gh("GET /emojis")
}
