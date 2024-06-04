
<!-- README.md is generated from README.Rmd. Please edit that file -->

# naratext

<!-- badges: start -->

![](https://img.shields.io/badge/cool-useless-green.svg)
<!-- badges: end -->

The goal of naratext is to …

## Installation

You can install from
[GitHub](https://github.com/coolbutuseless/naratext) with:

``` r
# install.packages('remotes')
remotes::install_github('coolbutuseless/naratext')
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
#' install.packages(c('textshaping', 'ragg'))
library(nara)
library(naratext)

strings <- c('Ping', ' #RStats')
font_files <- c(
  system.file("fonts", "Montserrat", "static", "Montserrat-BoldItalic.ttf", package="grDevices"),
  system.file("fonts", "Montserrat", "static", "Montserrat-Medium.ttf"    , package="grDevices")
)
color <- c('red', 'blue')
txt <- nr_text(strings, font_files = font_files, color = color)
plot(txt, T)
```

<img src="man/figures/README-example-1.png" width="100%" />
