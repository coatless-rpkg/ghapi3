
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![R build
status](https://github.com/coatless/ghapi3/workflows/R-CMD-check/badge.svg)](https://github.com/coatless/ghapi3/actions)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/ghapi3)](http://www.r-pkg.org/pkg/ghapi3)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/ghapi3)](https://cran.r-project.org/package=ghapi3)
[![Coverage
Status](https://img.shields.io/codecov/c/github/coatless/ghapi3/master.svg)](https://codecov.io/github/coatless/ghapi3?branch=master)
<!-- badges: end -->

## ghapi3

The goal of `ghapi3` is to provide a full-featured interface to GitHub’s
API v3.0. To do this, we use the [`gh`](https://github.com/r-lib/gh) *R*
package to access the GitHub API’s methods.

### Installation

You can install `ghapi3` from github with:

``` r
if(!requireNamespace("remotes", quietly = TRUE)) { install.packages("remotes") }
remotes::install_github("coatless/ghapi3")
```

### Implementation

We have support presently for:

| Implemented Functions           |
| :------------------------------ |
| add\_collaborator               |
| add\_org\_member                |
| add\_org\_team\_member          |
| browse\_commit\_diff            |
| check\_org\_private\_membership |
| check\_org\_public\_membership  |
| create\_org\_invitation\_email  |
| create\_org\_invitation\_ghname |
| create\_org\_repo               |
| create\_tag                     |
| create\_url\_commit\_diff       |
| create\_user\_repo              |
| get\_collaborator\_list         |
| get\_contributors\_list         |
| get\_emoji\_list                |
| get\_org\_invitations           |
| get\_org\_members\_list         |
| get\_org\_repos\_list           |
| get\_org\_team\_details         |
| get\_org\_team\_invitations     |
| get\_org\_teams\_list           |
| get\_self\_repos\_list          |
| get\_user\_repos\_list          |
| remove\_collaborator            |
| remove\_org\_member             |
| remove\_org\_team\_member       |
| transfer\_repo                  |
| update\_org\_member\_role       |

### License

GPL (\>= 2)
