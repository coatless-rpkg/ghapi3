
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Travis-CI Build
Status](https://travis-ci.org/coatless/ghapi.svg?branch=master)](https://travis-ci.org/coatless/ghapi)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/ghapi)](http://www.r-pkg.org/pkg/ghapi)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/ghapi)](https://cran.r-project.org/package=ghapi)
[![Coverage
Status](https://img.shields.io/codecov/c/github/coatless/ghapi/master.svg)](https://codecov.io/github/coatless/ghapi?branch=master)

# `ghapi`

The goal of `ghapi` is to provide a full-featured interface to GitHub’s
API v3.0. To do this, we use the [`gh`](https://github.com/r-lib/gh) *R*
package to access the GitHub API’s methods.

## Installation

You can install `ghapi` from github with:

``` r
# install.packages("devtools")
devtools::install_github("coatless/ghapi")
```

## Implementation

We have support presently for:

| Implemented Functions           |
| :------------------------------ |
| add\_org\_member                |
| add\_org\_team\_member          |
| check\_org\_private\_membership |
| check\_org\_public\_membership  |
| create\_org\_invitation\_email  |
| create\_org\_invitation\_ghname |
| create\_org\_repo               |
| create\_user\_repo              |
| get\_org\_invitations           |
| get\_org\_members\_list         |
| get\_org\_repos                 |
| get\_org\_team\_details         |
| get\_org\_teams\_list           |
| remove\_org\_member             |
| remove\_org\_team\_member       |
| update\_org\_member\_role       |

## License

GPL (\>= 2)
