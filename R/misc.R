#' List of Emoji Code and Image URLs
#'
#' Lists all the emojis available to use on GitHub.
#'
#' @export
#'
#' @references
#' <https://developer.github.com/v3/emojis/#emojis>
#'
#' @examples
#' # Retrieve the list of emoji
#' get_emoji_list()
get_emoji_list = function() {
  get_gh("GET /emojis")
}
