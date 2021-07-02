#' get_hessisch
#'
#' Translates German to Hessian
#'
#'
#' @param txt provide a text you want to translate from German into Hessian
#' @export
get_hessisch <- function(txt) {

  html <- rvest::session("https://www.iwwersedser.de/translate")
  hessform <- rvest::html_form(html)[[1]]

  hessform_in <- rvest::html_form_set(hessform, detext = txt)

  resp <- rvest::html_form_submit(hessform_in, submit = 1)

  fin <- rvest::read_html(resp) %>%
    rvest::html_nodes(".uk-card") %>%
    rvest::html_nodes("p") %>%
    rvest::html_text() %>%
    stringr::str_squish() %>%
    .[2] %>%
    fix_hessisch()

  return(fin)

}


fix_hessisch <- function(sen) {

  suppressWarnings(
    replace_dat <- sen %>%
      stringr::str_extract_all("\\S+(\\?)\\S+") %>%
      unlist() %>%
      tibble::tibble(matches = .) %>%
      dplyr::mutate(replaces = stringr::str_replace(matches, "\\?", "ä"),
             matches = stringr::str_replace_all(matches, "\\?", "\\\\?"))
  )

  if(nrow(replace_dat)!=0){
    for (jj in 1:nrow(replace_dat)) {
      sen <- stringr::str_replace_all(sen, replace_dat$matches[jj], replace_dat$replaces[jj])
    }
  }

  suppressWarnings(
    replace_start_dat <- sen %>%
      stringr::str_extract_all(" (\\?)\\S+") %>%
      stringr::str_squish() %>%
      unlist() %>%
      tibble::tibble(matches = .) %>%
      dplyr::mutate(replaces = stringr::str_replace(matches, "\\?", "Ä"),
             matches = stringr::str_replace_all(matches, "\\?", "\\\\?"))
  )


  if(nrow(replace_start_dat)!=0){
    for (jj in 1:nrow(replace_start_dat)) {
      sen <- stringr::str_replace_all(sen, replace_start_dat$matches[jj], replace_start_dat$replaces[jj])
    }
  }


  return(sen)

}
