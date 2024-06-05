


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Bitmap font render
#' 
#' @param string character string to render
#' @param font bitmap font \code{bm_font} object as read by \code{bittermelon::read_hex()},
#'        \code{bittermelon::read_monobit()} or \code{bittermelon::read_yaff()}
#' @param color default: 'black'
#' @param fill default: 'transparent'
#' 
#' @return New \code{nativeRaster} object
#' 
#' @examples
#' nr <- nara::nr_new(100, 100, 'white')
#' font_file <- system.file("fonts/spleen/spleen-8x16.hex.gz", package = "bittermelon") 
#' font <- bittermelon::read_hex(font_file)
#' txt <- nr_text_bitmap("Hello #RStats", font = font)
#' nara::nr_blit(nr, 1, 50, txt)
#' grid::grid.raster(nr)
#' 
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nr_text_bitmap <- function(string, font = NULL, color = 'black', fill = 'transparent') {
  
  if (is.null(font)) {
    font_file <- system.file("fonts/spleen/spleen-8x16.hex.gz", package = "bittermelon")
    font <- bittermelon::read_hex(font_file)
  }
  
  nr <- bittermelon::as_bm_bitmap(string, font = font) |> 
    nara::matrix_to_nr(palette = color, fill = fill) |> 
    nara::nr_flipv()
  
  nr
}