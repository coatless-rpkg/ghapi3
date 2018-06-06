
#' Wrapper for GitHub client's function
#'
#' Intermediary wrapper into the `gh` packages `gh` function.
#'
#' @param ... Additional parameters
#' @details
#' Wrapper function to `gh` for more control over package options
#' @noMd
#' @importFrom gh gh
delete_gh = function(...) {
  gh(...)
}

get_gh = function(...) {
  gh(...)
}

put_gh = function(...) {
  gh(...)
}

post_gh = function(...) {
  gh(...)
}
