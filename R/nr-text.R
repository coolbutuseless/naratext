
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Render strings to a \code{nativeRaster} image
#' 
#' @param strings strings to shape
#' @param font_files path to font
#' @param font_idx Index of font within \code{font_file}. Default: 0
#' @param scale size scale factor. Default: 1.0
#' @param color single colour
#' @param native_raster logical. Return a native raster? default: TRUE.
#'        If false, just returns a raster object
#' @param background background colour. Default 'transparent'
#' @param ... further arguments passed to \code{textshaping::shape_text()}
#' 
#' @return \code{nativeRaster}
#' 
#' @examples
#' strings <- c('Ping', ' #RStats')
#' font_files <- c(
#'   system.file("fonts", "Montserrat", "static", "Montserrat-BoldItalic.ttf", package="grDevices"),
#'   system.file("fonts", "Montserrat", "static", "Montserrat-Medium.ttf"    , package="grDevices")
#' )
#' color <- c('red', 'blue')
#' txt <- nr_text(strings, font_files = font_files, color = color)
#' plot(txt, T)
#' 
#' @importFrom nara raster_to_nr
#' @import grDevices
#' @importFrom textshaping shape_text
#' @importFrom ragg agg_capture
#'
#' @export
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nr_text <- function(strings, font_files, font_idx = 0, color = NA, scale = 1, background = 'transparent', native_raster = TRUE, ...) {
  
  ts <- textshaping::shape_text(strings, id = 1, weight = c(400, 700), path = font_files)
  
  font_list <- lapply(font_files, \(x) {
    grDevices::glyphFont(file = x, index = 0, family = "Montserrat", weight = 700, style = "italic")
  })
  
  glyph_font_list <- do.call(grDevices::glyphFontList, font_list)
  
  # font1 <- grDevices::glyphFont(file = font1_filename, index = 0, family = "Montserrat", weight = 700, style = "italic")
  # font2 <- grDevices::glyphFont(file = font2_filename, index = 0, family = "Montserrat", weight = 400, style = "normal")
  
  color <- rep.int(color, nchar(strings))
  
  glyphs <- grDevices::glyphInfo(
    id       = ts$shape$index, 
    x        = ts$shape$x_offset, 
    y        = ts$shape$y_offset - max(ts$shape$descender), 
    font     = ts$shape$string_id, 
    size     = ts$shape$font_size,
    fontList = glyph_font_list,
    width    = ts$metrics$width, 
    height   = ts$metrics$height, 
    col      = color
  )
  
  if (FALSE) {
    grid::grid.glyph(glyphs)
  }
  
  f <- ragg::agg_capture(
    width  = scale * (0 + ceiling(ts$metrics$width )), 
    height = scale * (4 + ceiling(ts$metrics$height)),
    background = background,
    scaling = scale
  )
  grid::grid.glyph(glyphs)
  im <- f()
  dev.off()
  
  if (isTRUE(native_raster)) {
    im |> as.raster() |> nara::raster_to_nr() 
  } else {
    im |> as.raster()
  }
}


if (FALSE) {
  
  library(nara)
  
  strings <- c('Ping', ' #RStats')
  font_files <- c(
    system.file("fonts", "Montserrat", "static", "Montserrat-BoldItalic.ttf", package="grDevices"),
    system.file("fonts", "Montserrat", "static", "Montserrat-Medium.ttf"    , package="grDevices")
  )
  color <- c('red', 'blue')
  txt <- nr_text(strings, font_files = font_files, col = col)
  plot(txt, T)
  
  
  grid::grid.newpage()
  nr <- nr_new(400, 400)
  txt <- nr_text()
  nr_blit(nr, 200, 200, txt)
  plot(nr)
  
}



