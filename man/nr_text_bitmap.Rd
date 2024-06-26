% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nara-text-bitmap.R
\name{nr_text_bitmap}
\alias{nr_text_bitmap}
\title{Bitmap font render}
\usage{
nr_text_bitmap(string, font = NULL, color = "black", fill = "transparent")
}
\arguments{
\item{string}{character string to render}

\item{font}{bitmap font \code{bm_font} object as read by \code{bittermelon::read_hex()},
\code{bittermelon::read_monobit()} or \code{bittermelon::read_yaff()}}

\item{color}{default: 'black'}

\item{fill}{default: 'transparent'}
}
\value{
New \code{nativeRaster} object
}
\description{
Bitmap font render
}
\examples{
nr <- nara::nr_new(100, 100, 'white')
font_file <- system.file("fonts/spleen/spleen-8x16.hex.gz", package = "bittermelon") 
font <- bittermelon::read_hex(font_file)
txt <- nr_text_bitmap("Hello #RStats", font = font)
nara::nr_blit(nr, 1, 50, txt)
grid::grid.raster(nr)

}
