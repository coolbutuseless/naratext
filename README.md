
<!-- README.md is generated from README.Rmd. Please edit that file -->

# naratext

<!-- badges: start -->

![](https://img.shields.io/badge/cool-useless-green.svg)
[![R-CMD-check](https://github.com/coolbutuseless/naratext/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/coolbutuseless/naratext/actions/workflows/R-CMD-check.yaml)
![](https://img.shields.io/badge/status-experimental-yellow.svg)
<!-- badges: end -->

`{naratext}` renders text to nativeRaster images in memory.

This relies of glyph rendering features in the `{grid}` package.

### What’s in the box

- `nr_text()` to render text to in-memory nativeRaster images

### ToDo

- Reconcile the different font handling mechanisms between `textshaping`
  and `grDevices::glyphFont()`
- Tightly crop the returned nativeRaster
- Return baseline offset from bottom of raster so that other compositors
  (e.g. `{nara}`) now how to place text correctly
- Move to textshaping’s C interface?

## Installation from [GitHub](https://github.com/coolbutuseless/naratext)

Also requires installation of:

- CRAN packages:
  - [`{textshaping}`](https://cran.r-project.org/package=textshaping) to
    calculate positions of rendered glyph
  - [`{ragg}`](https://cran.r-project.org/package=ragg) as a graphics
    device that allows direct capture of the output to an image in
    memory (and supports glyph rendering)
- GitHub packages
  - [`{nara}`](https://github.com/coolbutuseless/nara) for nativeRaster
    conversion

``` r
install.packages('remotes')
remotes::install_github('coolbutuseless/nara')
install.packages(c('textshaping', 'ragg'))

remotes::install_github('coolbutuseless/naratext')
```

## Example

``` r
library(grid)
library(nara)
library(naratext)

strings <- c('Ping', ' #RStats')
font_files <- c(
  system.file("fonts", "Montserrat", "static", "Montserrat-BoldItalic.ttf", package="grDevices"),
  system.file("fonts", "Montserrat", "static", "Montserrat-Medium.ttf"    , package="grDevices")
)
color <- c('red', 'blue')
txt <- nr_text(strings, font_files = font_files, color = color, scale = 10, background = 'lightblue')
dim(txt)
```

    #> [1] 190 810

``` r
class(txt)
```

    #> [1] "nativeRaster"

``` r
grid.raster(txt)
```

<img src="man/figures/README-example-1.png" width="100%" />
