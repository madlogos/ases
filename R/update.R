#' Update ases packages
#'
#' This will check to see if all ases packages (and optionally, their
#' dependencies) are up-to-date, and will install after an interactive
#' confirmation.
#'
#' @param recursive If \code{TRUE}, will also list all dependencies of
#'   ases packages.
#' @param repos The repositories to use to check for updates.
#'   Defaults to \code{getOptions("repos")}.
#' @export
#' @importFrom aseskit dep_pkgs
#' @seealso \code{\link[aseskit]{dep_pkgs}}
#' @examples
#' \dontrun{
#' ases_update()
#' }
ases_update <- function(recursive = FALSE, repos = getOption("repos")) {

    deps <- dep_pkgs("ases", recursive=recursive, repos=repos)
    behind <- dplyr::filter(deps, behind | is.na(local))

    if (nrow(behind) == 0) {
      cli::cat_line("All ases packages up-to-date or can no more be upgraded from CRAN.")
      return(invisible())
    }

    cli::cat_line("The following packages are out of date or not installed at all:")
    cli::cat_line()
    cli::cat_bullet(format(behind$package), " (", behind$local, " -> ", behind$cran, ")")

    cli::cat_line()
    cli::cat_line("Start a clean R session then run:")

    pkg_str <- paste0(deparse(behind$package), collapse = "\n")
    cli::cat_line("install.packages(", pkg_str, ")")



    invisible()
}


packageVersion <- function(pkg) {
    if (rlang::is_installed(pkg)) {
      utils::packageVersion(pkg)
    } else {
      0
    }
}
