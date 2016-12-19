#' Insert Totuzen No Shi
#'
#' @export
insertSuddenDeath  <- function() {
  ctx <- rstudioapi::getActiveDocumentContext()
  txt <- ctx$selection[[1]]$text
  w <- stringi::stri_width(txt)
  # 奇数の場合は1を足す
  w <- ceiling(w/2) * 2 + 4

  # Windowsだと文字コードを明示的に指定する必要あり
  Encoding(txt) <- "UTF-8"

  top    <- paste0("＿", stringi::stri_dup("人", w/2),   "＿")
  middle <- paste0("＞", stringi::stri_pad_both(txt, w), "＜")
  bottom <- paste0("￣", stringi::stri_dup("Y^", w/2),   "￣")

  rstudioapi::modifyRange(ctx$selection[[1]]$range, paste(top, middle, bottom, sep = "\n"))
}
