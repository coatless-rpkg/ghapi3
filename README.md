
<!-- README.md is generated from README.Rmd. Please edit that file -->

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

| Implemented Functions          |
| :----------------------------- |
| add\_org\_member               |
| add\_team\_member              |
| check\_org\_public\_membership |
| get\_org\_members\_list        |
| get\_org\_repos                |
| get\_org\_team\_details        |
| get\_org\_teams\_list          |
| remove\_org\_member            |
| remove\_team\_member           |
| update\_org\_member\_role      |

## License

GPL (\>= 2)
