#' ases: Easily Load ASES-Family Packages
#'
#' An analytic toolkit comprising of a family of toolkit packages for ASES.
#' 
#' @details This package is used to load the following packages at a time \cr 
#' \describe{
#'   \item{\pkg{\link{asesgeo}}}{Geographic-related functionalities}
#'   \item{\pkg{\link{asesmso}}}{MSOffice-related functionalities}
#'   \item{\pkg{\link{asesrpt}}}{Reporting-related functionalities}
#'   \item{\pkg{\link{asestio}}}{Data I/O and transformation}
#'   \item{\pkg{\link{asesvis}}}{Visualization}
#'   \item{\pkg{\link{aseskit}}}{Generic toolbox}
#' }
#' @author \strong{Creator, Maintainer}: Yiying Wang, \email{wangy@@aetna.com}
#' 
#' @importFrom magrittr %>%
#' @export %>%
#' @docType package
#' @keywords internal
#' @seealso \pkg{\link{aseskit}}
#' @name ases
NULL


release_questions <- function() {
  c(
    "Have you run `usethis::use_tidy_versions(TRUE)`?",
    "Have you tested with RStudio 1.0?"
  )
}
