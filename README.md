
<!-- README.md is generated from README.Rmd. Please edit that file -->

# naratext

<!-- badges: start -->

![](https://img.shields.io/badge/cool-useless-green.svg)
[![R-CMD-check](https://github.com/coolbutuseless/naratext/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/coolbutuseless/naratext/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

`{naratext}` renders text to raster/nativeRaster images using:

- `{textshaping}` to figure out rendered glyph positions
- `{ragg}` as a graphis device that allows direct capture of the output
  to a variable (rather than writing to file or screen)
- `grid::grid.glyph()` for rendering the glyphs in the calculated
  positions

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
txt <- nr_text(strings, font_files = font_files, color = color, scale = 10, background = 'grey90')
dim(txt)
```

    #> [1] 190 810

``` r
plot(txt, T)
```

<img src="man/figures/README-example-1.png" width="100%" />
